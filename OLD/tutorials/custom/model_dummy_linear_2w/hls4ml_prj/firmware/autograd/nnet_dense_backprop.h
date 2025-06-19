#ifndef NNET_DENSE_BACKPROP_H_
#define NNET_DENSE_BACKPROP_H_


// [@manuelbv]: Backprop works like this:
//      If we assume we have a dense layer with the following parameters:
//          X -> input data,        shape [1,     n_0]
//          W -> weights,           shape [n_0,   n_1]
//          Z -> out activation,    shape [1,     n_1]
//
//      In the forward pass, Z is basically: 
//          Z = X*W , where '*' symbolizes a matrix multiplication, such that:
//              Z[<all>] = 0;
//              for i in n_0:
//                  for j in n_1:
//                      Z[j] += X[i]*W[i][j]
//
//      Now, in the backward pass we have the following inouts:
//          grads_in -> These are the gradients (or the error) coming from the next layer down the line,
//              remember that in backprop we start at the end of the network and go back up.
//              These grads have the same shape as "Z" in the forward pass, that is  
//              shape [1,     n_1]
//          
//          Then, if this is a purely dense layer (no activation, or activation outside of this wrapper), the
//              Z_error can be computed as: 
//                  Z_error = grads_in*(W^T),            where (W^T) symbolizes the TRANSPOSE of the weights W
//
//              And Z_error has the shape:
//                  Z_error -> shape [1,   n_0]
//  
//          This can be implemented like:
//              Z_error[<all>] = 0;
//              for i in n_0:
//                  for j in n_1:
//                      Z_error[i] += grads_in[j]*W[i][j]
//

// Here I have some code in C++ to perform a template backprop in a dense layer:
/*
    
        #include <iostream>

        #define n_0 2
        #define n_1 3


        int main()
        {
            // Weights and biases
            double W[n_0][n_1] = {{1,2,3},{4,5,6}};
            double B[n_1] = {0.1,0.2,0.3};
            
            // Learning rate 
            double lr = 0.01;
            
            //double transpose[n_1][n_0];
            
            // Gradients (in, from next layer, and out to previous layer - remember, this is backprop, so we go from last layer up)
            double grads_in[n_1] = {1,2,3};
            double grads_out[n_0] = {0,0};
            
            // X is the input 
            double X[n_0] = {0,1};
            // Z is the output 
            double Z[n_1] = {0,0,0};

            std::cout << "-- Print current weights --------------------------" << std::endl << std::endl;

            for (int i = 0; i < n_0; i++) {
                for (int j = 0; j < n_1; j++) {
                    std::cout << "W[" << i << "][" << j << "] = " << W[i][j] << std::endl;
                }
            }
            
            for (int j = 0; j < n_1; j++) {
                std::cout << "B[" << j << "] = " << B[j] << std::endl;
            }
            
            std::cout << std::endl;

            std::cout << "-- FW pass --------------------------" << std::endl << std::endl;
            
            // Perform forward pass 
            for (int j = 0; j < n_1; j++) {
                for (int i = 0; i < n_0; i++) {
                    Z[j] += X[i]*W[i][j];
                }
                // Add bias 
                Z[j] += B[j];
                std::cout << "Z[" << j << "] = " << Z[j] << std::endl;
            }
            
            std::cout << std::endl;

            
            std::cout << "-- Compute grads --------------------------" << std::endl << std::endl;
            
            // Compute grads
            for (int i = 0; i < n_0; i++) {
                for (int j = 0; j < n_1; j++) {
                    grads_out[i] += grads_in[j]*W[i][j];
                }
                std::cout << "grads_out[" << i << "] = " << grads_out[i] << std::endl;
            }
            
            std::cout << std::endl;
            
            // Update weights
            std::cout << "-- Update weights --------------------------" << std::endl << std::endl;
            for (int i = 0; i < n_0; i++) {
                for (int j = 0; j < n_1; j++) {
                    std::cout << "W[" << i << "][" << j << "] = W[" << i << "][" << j << "] + lr*X[" << i << "]*grads_in[" << j << "] = ";
                    std::cout << W[i][j] << " + " << lr << "*" << X[i] << "*" << grads_in[j] << std::endl;
                    W[i][j] += lr*X[i]*grads_in[j];
                    
                    std::cout << "W[" << i << "][" << j << "] = " << W[i][j] << std::endl;
                }
            }
            
            std::cout << std::endl;
            
            
            // Update biases
            std::cout << "-- Update biases --------------------------" << std::endl << std::endl;
            for (int j = 0; j < n_1; j++) {
                std::cout << "B[" << j << "] = B[" << j << "] + lr*1*grads_in[" << j << "] = ";
                std::cout << B[j] << " + " << lr << "*1*" << grads_in[j] << std::endl;
                B[j] += lr*1*grads_in[j];
                
                std::cout << "B[" << j << "] = " << B[j] << std::endl;
            }

            
            std::cout << "----------------------------" << std::endl;
            
            
            
            return 0;
        }

*/


namespace nnet {

// [@manuelbv]: Dense back pass
template<class grads_in_T, class res_T, typename CONFIG_T>
void dense_backpass(
    grads_in_T    grads_in[CONFIG_T::n_out],
    res_T     grads_out[CONFIG_T::n_in],
    res_T    data_in[CONFIG_T::n_in],
    typename CONFIG_T::weight_t  weights[CONFIG_T::n_in*CONFIG_T::n_out],
    typename CONFIG_T::bias_t    biases[CONFIG_T::n_out])
{
    // #pragma HLS inline
    // if (CONFIG_T::strategy == nnet::latency) {
    //     dense_latency<data_T, res_T, CONFIG_T>(data, res, weights, biases);
    // } else {
    //     dense_resource<data_T, res_T, CONFIG_T>(data, res, weights, biases);
    // }


    // [@manuelbv]: Reset grads_out to zero 
    Reset: for (int i = 0; i < CONFIG_T::n_in; i++) {
        grads_out[i] = 0;
    }

    // [@manuelbv]: Compute gradients out first 
    Product1: for (int i = 0; i < CONFIG_T::n_in; i++) {
        for (int j = 0; j < CONFIG_T::n_out; j++) {
            // [@manuelbv]: Weights is actually a 1-D array, so we need to re-index 
            int index = i*CONFIG_T::n_out + j;
            grads_out[i] += grads_in[j] * weights[index];
        }
        std::cout << "grads_out[" << i << "] = " << grads_out[i] << std::endl;
    }


    // [@manuelbv]: Update weights
    Product2: for (int j = 0; j < CONFIG_T::n_out; j++) {
        for (int i = 0; i < CONFIG_T::n_in; i++) {
            int index = i*CONFIG_T::n_out + j;
            //std::cout << "W[" << i << "][" << j << "] = W[" << i << "][" << j << "] + lr*data_in[" << i << "]*grads_in[" << j << "] = ";
            std::cout << "W[" << i << "][" << j << "] = weights[index] <= weights[" << index << "] + lr*data_in[" << i << "]*grads_in[" << j << "] = ";
            std::cout << weights[index] << " + " << LEARNING_RATE << "*" << data_in[i] << "*" << grads_in[j] << " = ";
            
            weights[index] -= static_cast<res_T>(LEARNING_RATE) * data_in[i] * grads_in[j];
            
            std::cout << weights[index] << std::endl;
        }

        std::cout << "B[" << j << "] = B[" << j << "] + lr*1*grads_in[" << j << "] = ";
        std::cout << biases[j] << " + " << LEARNING_RATE << "*1*" << grads_in[j] << " = ";

        // [@manuelbv]: Now update Bias
        biases[j] -= static_cast<res_T>(LEARNING_RATE) * grads_in[j];

        std::cout << biases[j] << std::endl;
    }
    





    // res_T cache;

    // Reset: for(int ii = 0; ii < CONFIG_T::n_in; ii++) {
    //     // Initialize grads_out[ii] to zero
    //     grads_out[ii] = 0;
    // }

    // // Loop thru weights 
    // // Do the matrix-multiply
    // Product1: for(int jj = 0; jj < CONFIG_T::n_out; jj++) {
    //     // if (CONFIG_T::io_type == io_serial){
    //     //     #pragma HLS PIPELINE
    //     // }

    //     Product2: for(int ii = 0; ii < CONFIG_T::n_in; ii++) {
    //         // if (CONFIG_T::io_type == io_serial) {
    //         //     int multiplier_limit  = ceil(float(CONFIG_T::n_out) / float(CONFIG_T::reuse_factor));
    //         //     CONFIG_T::template product<data_T, typename CONFIG_T::weight_t, typename CONFIG_T::accum_t>::limit(multiplier_limit);
    //         // }

    //         // Contribution of the error (grads_in) to a specific weight
    //         int index = ii*CONFIG_T::n_out+jj;
    //         cache = grads_in[jj]*data_in[ii];

    //         // Add to grads_out
    //         grads_out[ii] += cache;
    //         // std::cout << std::endl << "---------------------------------" << std::endl;
    //         // std::cout << "grads_in[" << jj << "]=" << grads_in[jj] << std::endl;
    //         // std::cout << "data_in[" << ii << "]=" << data_in[ii] << std::endl;
    //         // std::cout << "cache=" << cache << " for ii=" << ii << " jj=" << jj << std::endl;


    //         // Update weights
    //         // std::cout << "learning_rate=" << static_cast<data_T>(LEARNING_RATE) << std::endl;
    //         // std::cout << "weights[" << index << "]=" << weights[index] << " --> " << weights[index] - (static_cast<data_T>(LEARNING_RATE)*cache) << std::endl;
    //         weights[index] -=  static_cast<res_T>(LEARNING_RATE)*cache;


    //         // grads
    //         // printf(" %.10s |", grads_out[0].to_string(10, true).c_str());
    //         printf(" %.10s |", grads_out[ii].to_string(10, true).c_str());
    //         // weights 
    //         // printf(" %.10s |", weights[0].to_string(10, true).c_str());
    //         printf(" %.10s |", weights[index].to_string(10, true).c_str());
    //         // biases
    //         //printf(" %.10s |", biases[0].to_string(10, true).c_str());


    //     }


    //     // Update biases (only if we are using them)
    //     // std::cout << "biases[" << jj << "]=" << biases[jj] << " --> " << biases[jj] - (static_cast<data_T>(LEARNING_RATE)*grads_in[jj]) << std::endl;
    //     // std::cout << "We are not actually using biases..." << std::endl;
    //     // //biases[jj] -= static_cast<data_T>(LEARNING_RATE)*grads_in[jj];

    // }

}

}

#endif
