// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s (
        ap_ready,
        data_0_V_read,
        ap_return
);


output   ap_ready;
input  [15:0] data_0_V_read;
output  [15:0] ap_return;

assign ap_ready = 1'b1;

assign ap_return = data_0_V_read;

endmodule //linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s
