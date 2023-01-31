#ifndef NNET_LOSSES_MSE_H_
#define NNET_LOSSES_MSE_H_

#include <math.h>

// 
//#include "../nnet_utils/nnet_common.h"

namespace losses {

struct mse_config
{
    // Internal data type definitions
    // typedef float bias_t;
    // typedef float weight_t;
    typedef float accum_t;

    // Layer Sizes
    static const unsigned n_out = 10;

    // Resource reuse info
    
    // io_parallel defintion depends on nnet_utils/nnet_common.h, which I can't manage to include here for some reason
    //static const unsigned io_type = io_parallel;


    // static const unsigned strategy = latency; 
    // static const unsigned reuse_factor = 1;
    // static const bool store_weights_in_bram = false;
    // static const unsigned n_zeros = 0;
    // // partitioning arrays cyclically to go with roll factors?
    // // Product function to use
    // template<class x_T, class y_T, class res_T>
    // using product = nnet::product::mult<x_T, y_T, res_T>;
};

    template<class res_T, typename CONFIG_T>
    void mse(
        res_T    predictions[CONFIG_T::n_out],
        res_T    ground_truth[CONFIG_T::n_out],
        res_T    &loss,
        res_T    grad[CONFIG_T::n_out])
    {
        res_T cache1;
        res_T cache2;
        res_T divergences[CONFIG_T::n_out];
        //res_T accum; 
        //typename CONFIG_T::accum_t divergences[CONFIG_T::n_out];

        // #pragma HLS inline
        // if (CONFIG_T::strategy == nnet::latency) {
        //     dense_latency<data_T, res_T, CONFIG_T>(data, res, weights, biases);
        // } else {
        //     dense_resource<data_T, res_T, CONFIG_T>(data, res, weights, biases);
        // }


        // calculate divergence for each output
        Divergence1: for(int ii = 0; ii < CONFIG_T::n_out; ii++) {
            // if (CONFIG_T::io_type == io_serial){
            //     #pragma HLS PIPELINE
            // }
            cache1 = predictions[ii];
            cache2 = ground_truth[ii];

            divergences[ii] = (cache2 - cache1);

            // Init grad 
            grad[ii] = -(divergences[ii]);
            std::cout << "cache1 (preds): " << cache1 << std::endl;
            std::cout << "cache2 (ground): " << cache2 << std::endl;
            std::cout << "divergences: " << divergences[ii] << std::endl;
            std::cout << "grad: " << grad[ii] << std::endl;
        }

        // Reset loss to 0
        loss = 0;

        // Compute square exponents and add over all of them
        Squares_and_add: for(int ii = 0; ii < CONFIG_T::n_out; ii++){
            // if (CONFIG_T::io_type == io_serial){
            //     #pragma HLS UNROLL
            // }
            loss += (divergences[ii]*divergences[ii]);
            
        }

        // Divide by 1/2 (the reason behind this is that the 2 exponent in the mse cancels out when differentiating during backprop)
        loss = static_cast<res_T>(0.5)*loss;
        std::cout << "loss: " << loss << std::endl;


        // Result: for(int ires = 0; ires < CONFIG_T::n_out; ires++){
        //     if (CONFIG_T::io_type == io_serial){
        //         #pragma HLS UNROLL
        //     }
        //     //res[ires] = (res_T) (acc[ires]);
        //     res[ires] = cast<data_T, res_T, CONFIG_T>(acc[ires]);
        // }

    }
}

#endif
