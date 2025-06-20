#ifndef NNET_ACTIVATION_BACKPROP_H_
#define NNET_ACTIVATION_BACKPROP_H_
#pragma once
namespace nnet {

// [@manuelbv]: Linear backpass (this is actually pretty silly)
template<class grad_in_T, class res_T, typename CONFIG_T>
void  linear_backpass(grad_in_T grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
{
    // if (CONFIG_T::io_type == io_parallel){
    //     #pragma HLS PIPELINE
    // }

    for (int ii=0; ii<CONFIG_T::n_in; ii++) {
        // if (CONFIG_T::io_type == io_serial){
        //     #pragma HLS PIPELINE
        // }
        grads_out[ii] = grads_in[ii];
    }
}

template<class grad_in_T, class res_T, typename CONFIG_T>
void  relu_backpass(grad_in_T grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
{
    // if (CONFIG_T::io_type == io_parallel){
    //     #pragma HLS PIPELINE
    // }
    /*
        change by Gindy 
            f'(z) =  1, if z > 0
                     0, if z < 0

        δ = δ_out
    */
    //could unroll here
    for (int ii=0; ii<CONFIG_T::n_in; ii++) {
        // if (CONFIG_T::io_type == io_serial){
        //     #pragma HLS PIPELINE
        // }
        if(grads_in[ii] < 0){
            grads_out[ii] = 0;
        } else {
            grads_out[ii] = 1;
        }
    }
}

// template<class grad_in_T, class res_T, typename CONFIG_T>
// void  sigmoid(grad_in_T grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
// {
//     // if (CONFIG_T::io_type == io_parallel){
//     //     #pragma HLS PIPELINE
//     // }

//     for (int ii=0; ii<CONFIG_T::n_in; ii++) {
//         // if (CONFIG_T::io_type == io_serial){
//         //     #pragma HLS PIPELINE
//         // }
//         grads_out[ii] = grads_in[ii];
//     }
// }

// template<class grad_in_T, class res_T, typename CONFIG_T>
// void  tanh(grad_in_T grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
// {
//     // if (CONFIG_T::io_type == io_parallel){
//     //     #pragma HLS PIPELINE
//     // }

//     for (int ii=0; ii<CONFIG_T::n_in; ii++) {
//         // if (CONFIG_T::io_type == io_serial){
//         //     #pragma HLS PIPELINE
//         // }
//         grads_out[ii] = grads_in[ii];
//     }
// }

// template<class grad_in_T, class res_T, typename CONFIG_T>
// void  tanh(grad_in_T grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
// {
//     // if (CONFIG_T::io_type == io_parallel){
//     //     #pragma HLS PIPELINE
//     // }

//     for (int ii=0; ii<CONFIG_T::n_in; ii++) {
//         // if (CONFIG_T::io_type == io_serial){
//         //     #pragma HLS PIPELINE
//         // }
//         grads_out[ii] = grads_in[ii];
//     }
// }

}

#endif