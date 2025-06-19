#ifndef DEFINES_H_
#define DEFINES_H_

#include "ap_int.h"
#include "ap_fixed.h"
#include "nnet_utils/nnet_types.h"
#include <cstddef>
#include <cstdio>

//hls-fpga-machine-learning insert numbers
#define N_INPUT_1_1 1
#define N_LAYER_2 2
#define N_LAYER_4 1

//hls-fpga-machine-learning insert layer-precision
typedef ap_fixed<16,6> model_default_t;
typedef ap_fixed<16,6> input_t;
typedef ap_fixed<16,6> layer2_t;
typedef ap_fixed<6,1> weight2_t;
typedef ap_uint<1> bias2_t;
typedef ap_fixed<16,6,AP_RND,AP_SAT> layer3_t;
typedef ap_fixed<16,6> layer4_t;
typedef ap_fixed<6,1> weight4_t;
typedef ap_uint<1> bias4_t;
typedef ap_fixed<16,6,AP_RND,AP_SAT> result_t;


// [@manuelbv]: Changed this to a very large precision for the manual testing/computation of loss
// typedef ap_fixed<128,64> model_default_t;
// typedef ap_fixed<128,64> input_t;
// typedef ap_fixed<128,64> layer2_t;
// typedef ap_fixed<128,64> weight2_t;
// typedef ap_fixed<128,64> bias2_t;
// typedef ap_fixed<128,64,AP_RND,AP_SAT> layer3_t;
// typedef ap_fixed<128,64> layer4_t;
// typedef ap_fixed<128,64> weight4_t;
// typedef ap_fixed<128,64> bias4_t;
// typedef ap_fixed<128,64,AP_RND,AP_SAT> result_t;

#endif
