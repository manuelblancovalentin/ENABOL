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
#include <fstream>
#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "firmware/myproject.h"
#include "firmware/nnet_utils/nnet_helpers.h"

//hls-fpga-machine-learning insert bram

//hls-fpga-machine-learning insert autograd-helpers-include
#include "firmware/autograd/trainer_helpers.h"

#define CHECKPOINT 1

namespace nnet {
    bool trace_enabled = true;
    std::map<std::string, void *> *trace_outputs = NULL;
    size_t trace_type_size = sizeof(double);
}

int main(int argc, char **argv)
{
  //load input data from text file
  std::ifstream fin("tb_data/tb_input_features.dat");
  //load predictions from text file
  std::ifstream fpr("tb_data/tb_output_predictions.dat");

#ifdef RTL_SIM
  std::string RESULTS_LOG = "tb_data/rtl_cosim_results.log";
#else
  std::string RESULTS_LOG = "tb_data/csim_results.log";
#endif
  std::ofstream fout(RESULTS_LOG);

  //hls-fpga-machine-learning insert autograd-output-file-declaration
  // Create losses file
  std::string LOSSES_LOG = "tb_data/losses.log";
  std::ofstream flosses(LOSSES_LOG);

  // Print header of losses file
  flosses << "loss_layer5_out" << "\n";
  // [@manuelbv]: Definition of epoch
  int epoch = 0;

  // [@manuelbv]: Definition of train variable (to apply backprop or not)
  bool train = (fin.is_open() && fpr.is_open());

  // [@manuelbv]: Print header for table
  autograd::print_trainer_table_header();


  std::string iline;
  std::string pline;
  int e = 0;

  if (fin.is_open() && fpr.is_open()) {
    while ( std::getline(fin,iline) && std::getline (fpr,pline) ) {
//      if (e % CHECKPOINT == 0) std::cout << "Processing input " << e << std::endl;
      if (e % CHECKPOINT == 0) {
            // [@manuelbv]: Print input (sample) number
            printf("| %.10d |", e);
            printf(" %.10d |", epoch);
            printf(" %.10u |", BATCH_SIZE);
            //std::cout << "Processing input " << e << std::endl;
      }
      char* cstr=const_cast<char*>(iline.c_str());
      char* current;
      std::vector<float> in;
      current=strtok(cstr," ");
      while(current!=NULL) {
        in.push_back(atof(current));
        current=strtok(NULL," ");
      }
      cstr=const_cast<char*>(pline.c_str());
      std::vector<float> pr;
      current=strtok(cstr," ");
      while(current!=NULL) {
        pr.push_back(atof(current));
        current=strtok(NULL," ");
      }

      //hls-fpga-machine-learning insert data
      input_t fc1_input[N_INPUT_1_1];
      nnet::copy_data<float, input_t, 0, N_INPUT_1_1>(in, fc1_input);
      result_t layer5_out[N_LAYER_4];



      // [@manuelbv]: Definition of loss
      result_t loss_layer5_out;
      result_t ground_truth_layer5_out[N_LAYER_4];

      for (int i = 0; i < N_LAYER_4; i++) {
            ground_truth_layer5_out[i] = static_cast<result_t>(pr[i]);
      }

      //hls-fpga-machine-learning insert top-level-function
      unsigned short size_in1,size_out1;
      myproject(fc1_input,layer5_out, loss_layer5_out,size_in1,size_out1, ground_truth_layer5_out, train);
      flosses << loss_layer5_out << "\n";

      if (e % CHECKPOINT == 0) {
        //hls-fpga-machine-learning insert autograd_custom_printing
        // Loss
        //std::cout << "Loss: " << loss << std::endl;
        printf(" %.10s |", loss_layer5_out.to_string(10, true).c_str());
        
        // [@manuelbv]: Custom printing
        if ( N_INPUT_1_1 > 0 ) {
          //input
          printf(" %.10s |", fc1_input[0].to_string(10, true).c_str());
        }

        if ( N_LAYER_4 > 0 ) {
          //Prediction
          printf(" %.10s |", layer5_out[0].to_string(10, true).c_str());
          
          //Ground truth
          printf(" %.8f |", pr[0]);
          
        }

        std::cout << std::endl;
//        std::cout << "Predictions" << std::endl;
        //hls-fpga-machine-learning insert predictions
        //for(int i = 0; i < N_LAYER_4; i++) {
        //  std::cout << pr[i] << " ";
        //}
        //std::cout << std::endl;
//        std::cout << "Quantized predictions" << std::endl;
        //hls-fpga-machine-learning insert quantized
        //nnet::print_result<result_t, N_LAYER_4>(layer5_out, std::cout, true);
      }
      e++;

      //hls-fpga-machine-learning insert tb-output
      nnet::print_result<result_t, N_LAYER_4>(layer5_out, fout);

    }
    fin.close();
    fpr.close();
    //hls-fpga-machine-learning insert autograd-output-file-closure
    flosses.close();
  } else {
    std::cout << "INFO: Unable to open input/predictions file, using default input." << std::endl;

    //hls-fpga-machine-learning insert zero
    input_t fc1_input[N_INPUT_1_1];
    nnet::fill_zero<input_t, N_INPUT_1_1>(fc1_input);
    result_t layer5_out[N_LAYER_4];



    // [@manuelbv]: Definition of loss
    result_t loss_layer5_out;
    result_t ground_truth_layer5_out[N_LAYER_4];


    //hls-fpga-machine-learning insert top-level-function
    unsigned short size_in1,size_out1;
    myproject(fc1_input,layer5_out, loss_layer5_out,size_in1,size_out1, ground_truth_layer5_out, train);
    flosses << loss_layer5_out << "\n";

    //hls-fpga-machine-learning insert output
    //nnet::print_result<result_t, N_LAYER_4>(layer5_out, std::cout, true);

    //hls-fpga-machine-learning insert tb-output
    nnet::print_result<result_t, N_LAYER_4>(layer5_out, fout);

  }

  fout.close();
  std::cout << "INFO: Saved inference results to file: " << RESULTS_LOG << std::endl;

  return 0;
}
