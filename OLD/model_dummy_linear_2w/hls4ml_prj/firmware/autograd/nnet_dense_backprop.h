#ifndef NNET_DENSE_BACKPROP_H_
#define NNET_DENSE_BACKPROP_H_

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

    res_T cache;

    Reset: for(int ii = 0; ii < CONFIG_T::n_in; ii++) {
        // Initialize grads_out[ii] to zero
        grads_out[ii] = 0;
    }

    // Loop thru weights 
    // Do the matrix-multiply
    Product1: for(int jj = 0; jj < CONFIG_T::n_out; jj++) {
        // if (CONFIG_T::io_type == io_serial){
        //     #pragma HLS PIPELINE
        // }

        Product2: for(int ii = 0; ii < CONFIG_T::n_in; ii++) {
            // if (CONFIG_T::io_type == io_serial) {
            //     int multiplier_limit  = ceil(float(CONFIG_T::n_out) / float(CONFIG_T::reuse_factor));
            //     CONFIG_T::template product<data_T, typename CONFIG_T::weight_t, typename CONFIG_T::accum_t>::limit(multiplier_limit);
            // }

            // Contribution of the error (grads_in) to a specific weight
            // int index = ii*CONFIG_T::n_out+jj;
            int index = jj*CONFIG_T::n_in+ii;
            cache = grads_in[jj]*data_in[ii];

            // Add to grads_out
            grads_out[ii] += cache;
            std::cout << std::endl << "---------------------------------" << std::endl;
            std::cout << "grads_in[" << jj << "]=" << grads_in[jj] << std::endl;
            std::cout << "data_in[" << ii << "]=" << data_in[ii] << std::endl;
            std::cout << "cache=" << cache << " for ii=" << ii << " jj=" << jj << std::endl;


            // Update weights
            // std::cout << "learning_rate=" << static_cast<data_T>(LEARNING_RATE) << std::endl;
            // std::cout << "weights[" << index << "]=" << weights[index] << " --> " << weights[index] - (static_cast<data_T>(LEARNING_RATE)*cache) << std::endl;
            weights[index] -=  static_cast<res_T>(LEARNING_RATE)*cache;


            // grads
            // printf(" %.10s |", grads_out[0].to_string(10, true).c_str());
            printf(" %.10s |", grads_out[ii].to_string(10, true).c_str());
            // weights 
            // printf(" %.10s |", weights[0].to_string(10, true).c_str());
            printf(" %.10s |", weights[index].to_string(10, true).c_str());
            // biases
            //printf(" %.10s |", biases[0].to_string(10, true).c_str());


        }


        // Update biases (only if we are using them)
        // std::cout << "biases[" << jj << "]=" << biases[jj] << " --> " << biases[jj] - (static_cast<data_T>(LEARNING_RATE)*grads_in[jj]) << std::endl;
        // std::cout << "We are not actually using biases..." << std::endl;
        // //biases[jj] -= static_cast<data_T>(LEARNING_RATE)*grads_in[jj];

    }

    
    

}

}

#endif