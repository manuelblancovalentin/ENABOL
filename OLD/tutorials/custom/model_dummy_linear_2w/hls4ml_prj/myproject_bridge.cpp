#ifndef MYPROJECT_BRIDGE_H_
#define MYPROJECT_BRIDGE_H_

#include "firmware/myproject.h"
#include "firmware/nnet_utils/nnet_helpers.h"
#include <algorithm>
#include <map>

//hls-fpga-machine-learning insert bram


namespace nnet {
    bool trace_enabled = false;
    std::map<std::string, void *> *trace_outputs = NULL;
    size_t trace_type_size = sizeof(double);
}

extern "C" {

struct trace_data {
    const char *name;
    void *data;
};

void allocate_trace_storage(size_t element_size) {
    nnet::trace_enabled = true;
    nnet::trace_outputs = new std::map<std::string, void *>;
    nnet::trace_type_size = element_size;
}

void free_trace_storage() {
    for (std::map<std::string, void *>::iterator i = nnet::trace_outputs->begin(); i != nnet::trace_outputs->end(); i++) {
        void *ptr = i->second;
        free(ptr);
    }
    nnet::trace_outputs->clear();
    delete nnet::trace_outputs;
    nnet::trace_outputs = NULL;
    nnet::trace_enabled = false;
}

void collect_trace_output(struct trace_data *c_trace_outputs) {
    int ii = 0;
    for (std::map<std::string, void *>::iterator i = nnet::trace_outputs->begin(); i != nnet::trace_outputs->end(); i++) {
        c_trace_outputs[ii].name = i->first.c_str();
        c_trace_outputs[ii].data = i->second;
        ii++;
    }
}

// Wrapper of top level function for Python bridge
void myproject_float(
    float fc1_input[N_INPUT_1_1],
    float layer5_out[N_LAYER_4],
    float &loss_layer5_out,
    unsigned short &const_size_in_1,
    unsigned short &const_size_out_1,
    float layer5_out_ground_truth[N_LAYER_4]
) {
    
    input_t fc1_input_ap[N_INPUT_1_1];
    nnet::convert_data<float, input_t, N_INPUT_1_1>(fc1_input, fc1_input_ap);

    result_t layer5_out_ap[N_LAYER_4];
    result_t loss_layer5_out_ap;
    result_t layer5_out_ground_truth_ap[N_LAYER_4];

    myproject(fc1_input_ap,layer5_out_ap,loss_layer5_out_ap,const_size_in_1,const_size_out_1,layer5_out_ground_truth_ap);

    nnet::convert_data<result_t, float, N_LAYER_4>(layer5_out_ap, layer5_out);
    nnet::convert_data<result_t, float, N_LAYER_4>(layer5_out_ground_truth_ap, layer5_out_ground_truth);
    nnet::convert_data<result_t, float, 1>(&loss_layer5_out_ap, &loss_layer5_out);
}

void myproject_double(
    double fc1_input[N_INPUT_1_1],
    double layer5_out[N_LAYER_4],
    double &loss_layer5_out,
    unsigned short &const_size_in_1,
    unsigned short &const_size_out_1,
    double layer5_out_ground_truth[N_LAYER_4]
) {
    input_t fc1_input_ap[N_INPUT_1_1];
    nnet::convert_data<double, input_t, N_INPUT_1_1>(fc1_input, fc1_input_ap);

    result_t layer5_out_ap[N_LAYER_4];
    result_t loss_layer5_out_ap;
    result_t layer5_out_ground_truth_ap[N_LAYER_4];

    myproject(fc1_input_ap,layer5_out_ap,loss_layer5_out_ap,const_size_in_1,const_size_out_1,layer5_out_ground_truth_ap);

    nnet::convert_data<result_t, double, N_LAYER_4>(layer5_out_ap, layer5_out);
    nnet::convert_data<result_t, double, N_LAYER_4>(layer5_out_ground_truth_ap, layer5_out_ground_truth);
    nnet::convert_data<result_t, double, 1>(&loss_layer5_out_ap, &loss_layer5_out);
}

}

#endif
