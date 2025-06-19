#ifndef LOSSES_PARAMETERS_H_
#define LOSSES_PARAMETERS_H_

#include "ap_fixed.h"

#include "mse.h"

// [@manuelbv]: Added this for loss computation
struct mse_config : losses::mse_config {
    static const unsigned n_out = N_LAYER_2;
    typedef ap_fixed<16,6> accum_t;
    // template<class x_T, class y_T, class res_T>
    // using product = nnet::product::mult<x_T, y_T, res_T>;

    // typedef float accum_t;

    // Layer Sizes
   // static const unsigned n_out = 10;
};

#endif

