#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("fc1_input_V", 16, hls_in, 0, "ap_vld", "in_data", 1),
	Port_Property("fc1_input_V_ap_vld", 1, hls_in, 0, "ap_vld", "in_vld", 1),
	Port_Property("layer5_out_0_V", 16, hls_out, 1, "ap_vld", "out_data", 1),
	Port_Property("layer5_out_0_V_ap_vld", 1, hls_out, 1, "ap_vld", "out_vld", 1),
	Port_Property("loss_layer5_out_V", 16, hls_out, 2, "ap_vld", "out_data", 1),
	Port_Property("loss_layer5_out_V_ap_vld", 1, hls_out, 2, "ap_vld", "out_vld", 1),
	Port_Property("const_size_in_1", 16, hls_out, 3, "ap_vld", "out_data", 1),
	Port_Property("const_size_in_1_ap_vld", 1, hls_out, 3, "ap_vld", "out_vld", 1),
	Port_Property("const_size_out_1", 16, hls_out, 4, "ap_vld", "out_data", 1),
	Port_Property("const_size_out_1_ap_vld", 1, hls_out, 4, "ap_vld", "out_vld", 1),
	Port_Property("layer5_out_ground_truth_V_address0", 1, hls_out, 5, "ap_memory", "mem_address", 1),
	Port_Property("layer5_out_ground_truth_V_ce0", 1, hls_out, 5, "ap_memory", "mem_ce", 1),
	Port_Property("layer5_out_ground_truth_V_q0", 16, hls_in, 5, "ap_memory", "mem_dout", 1),
	Port_Property("train", 1, hls_in, 6, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "myproject";
