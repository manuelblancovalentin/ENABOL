#ifndef NNET_ACTIVATION_BACKPROP_H_
#define NNET_ACTIVATION_BACKPROP_H_

namespace nnet {

// [@manuelbv]: Linear backpass (this is actually pretty silly)
template<class res_T, typename CONFIG_T>
void  linear_backpass(result_t grads_in[CONFIG_T::n_in], res_T grads_out[CONFIG_T::n_in])
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

}

#endif