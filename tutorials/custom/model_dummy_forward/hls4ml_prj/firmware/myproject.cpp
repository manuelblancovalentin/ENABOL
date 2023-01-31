//
//    rfnoc-hls-neuralnet: Vivado HLS code for neural-net building blocks
//
//    Copyright (C) 2017 EJ Kreinar
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
#include <iostream>

#include "myproject.h"
#include "parameters.h"

void myproject(
    input_t fc1_input[N_INPUT_1_1],
    result_t layer3_out[N_LAYER_2],
    result_t &loss,
    unsigned short &const_size_in_1,
    unsigned short &const_size_out_1,
    result_t layer3_ground_truth[N_LAYER_2]
) {

    //hls-fpga-machine-learning insert IO
    #pragma HLS ARRAY_RESHAPE variable=fc1_input complete dim=0
    #pragma HLS ARRAY_PARTITION variable=layer3_out complete dim=0
    #pragma HLS INTERFACE ap_vld port=fc1_input,layer3_out 
    #pragma HLS PIPELINE 

    const_size_in_1 = N_INPUT_1_1;
    const_size_out_1 = N_LAYER_2;

#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        //hls-fpga-machine-learning insert load weights
        nnet::load_weights_from_txt<weight2_t, 1>(w2, "w2.txt");
        nnet::load_weights_from_txt<bias2_t, 1>(b2, "b2.txt");
        loaded_weights = true;
    }
#endif

    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    //hls-fpga-machine-learning insert layers

    layer2_t layer2_out[N_LAYER_2];
    #pragma HLS ARRAY_PARTITION variable=layer2_out complete dim=0
    nnet::dense<input_t, layer2_t, config2>(fc1_input, layer2_out, w2, b2); // fc1

    nnet::linear<layer2_t, result_t, linear_config3>(layer2_out, layer3_out); // fc1_linear

    //[@manuelbv]: Instantiate the loss and grads
    result_t grads_layer3_out[N_LAYER_2];
    if(layer3_ground_truth != nullptr) {
        std::cout <<  "Ground truth passed to nnet seems valid, computing loss" << std::endl ;
        losses::mse<result_t, mse_config>(layer3_out,layer3_ground_truth,loss,grads_layer3_out);
    } else {
        std::cout <<  "Ground truth passed to nnet is nullptr, invalid loss" << std::endl ;
        losses::mse<result_t, mse_config>(layer3_out,layer3_out,loss,grads_layer3_out);
    }
    std::cout << "Loss: " << loss << std::endl;

    // [@manuelbv]: Backpass
    // see: https://mattmazur.com/2015/03/17/a-step-by-step-backpropagation-example/

    // linear
    result_t grads_layer2_out[N_LAYER_2];
    nnet::linear_backpass<result_t, linear_config3>(grads_layer3_out, grads_layer2_out); // fc1_linear

    // fc1 
    result_t grads_fc1_out[N_LAYER_2];
    nnet::dense_backpass<input_t, result_t, config2>(grads_layer2_out, grads_fc1_out, fc1_input, w2, b2); // fc1

}
