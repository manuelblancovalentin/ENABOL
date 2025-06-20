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

#ifndef MYPROJECT_H_
#define MYPROJECT_H_

#include "ap_int.h"
#include "ap_fixed.h"
#include "hls_stream.h"

#include "defines.h"

// -------------------------- AUTOGRAD --------------------------
// [@manuelbv]: Manually including definitions for autograd
#include "autograd/autograd_defines.h"

// [@manuelbv]: Manually importing losses
#include "losses/mse.h"

// [@manuelbv]: Import backprop implementations
#include "autograd/nnet_activation_backprop.h"
#include "autograd/nnet_dense_backprop.h"
// --------------------------------------------------------------


// Prototype of top level function for C-synthesis
void myproject(
    input_t fc1_input[N_INPUT_1_1],
    result_t layer3_out[N_LAYER_2],
    result_t &loss,
    unsigned short &const_size_in_1,
    unsigned short &const_size_out_1,
    result_t layer3_ground_truth[N_LAYER_2] = nullptr
);

#endif
