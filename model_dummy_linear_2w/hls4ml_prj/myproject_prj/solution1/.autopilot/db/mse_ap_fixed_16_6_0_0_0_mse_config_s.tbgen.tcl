set moduleName mse_ap_fixed_16_6_0_0_0_mse_config_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mse<ap_fixed<16, 6, 0, 0, 0>, mse_config>}
set C_modelType { int 48 }
set C_modelArgList {
	{ predictions_0_V_read int 16 regular  }
	{ predictions_1_V_read int 16 regular  }
	{ ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "predictions_0_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "predictions_1_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 48} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ predictions_0_V_read sc_in sc_lv 16 signal 0 } 
	{ predictions_1_V_read sc_in sc_lv 16 signal 1 } 
	{ ground_truth_V_address0 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q0 sc_in sc_lv 16 signal 2 } 
	{ ground_truth_V_address1 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q1 sc_in sc_lv 16 signal 2 } 
	{ ap_return_0 sc_out sc_lv 16 signal -1 } 
	{ ap_return_1 sc_out sc_lv 16 signal -1 } 
	{ ap_return_2 sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "predictions_0_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_0_V_read", "role": "default" }} , 
 	{ "name": "predictions_1_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_1_V_read", "role": "default" }} , 
 	{ "name": "ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address0" }} , 
 	{ "name": "ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce0" }} , 
 	{ "name": "ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q0" }} , 
 	{ "name": "ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address1" }} , 
 	{ "name": "ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce1" }} , 
 	{ "name": "ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q1" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "mse_ap_fixed_16_6_0_0_0_mse_config_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "predictions_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "predictions_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "ground_truth_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U5", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U6", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	predictions_0_V_read { ap_none {  { predictions_0_V_read in_data 0 16 } } }
	predictions_1_V_read { ap_none {  { predictions_1_V_read in_data 0 16 } } }
	ground_truth_V { ap_memory {  { ground_truth_V_address0 mem_address 1 1 }  { ground_truth_V_ce0 mem_ce 1 1 }  { ground_truth_V_q0 mem_dout 0 16 }  { ground_truth_V_address1 MemPortADDR2 1 1 }  { ground_truth_V_ce1 MemPortCE2 1 1 }  { ground_truth_V_q1 MemPortDOUT2 0 16 } } }
}
set moduleName mse_ap_fixed_16_6_0_0_0_mse_config_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mse<ap_fixed<16, 6, 0, 0, 0>, mse_config>}
set C_modelType { int 48 }
set C_modelArgList {
	{ predictions_0_V_read int 16 regular  }
	{ predictions_1_V_read int 16 regular  }
	{ ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "predictions_0_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "predictions_1_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 48} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ predictions_0_V_read sc_in sc_lv 16 signal 0 } 
	{ predictions_1_V_read sc_in sc_lv 16 signal 1 } 
	{ ground_truth_V_address0 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q0 sc_in sc_lv 16 signal 2 } 
	{ ground_truth_V_address1 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q1 sc_in sc_lv 16 signal 2 } 
	{ ap_return_0 sc_out sc_lv 16 signal -1 } 
	{ ap_return_1 sc_out sc_lv 16 signal -1 } 
	{ ap_return_2 sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "predictions_0_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_0_V_read", "role": "default" }} , 
 	{ "name": "predictions_1_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_1_V_read", "role": "default" }} , 
 	{ "name": "ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address0" }} , 
 	{ "name": "ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce0" }} , 
 	{ "name": "ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q0" }} , 
 	{ "name": "ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address1" }} , 
 	{ "name": "ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce1" }} , 
 	{ "name": "ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q1" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "mse_ap_fixed_16_6_0_0_0_mse_config_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "predictions_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "predictions_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "ground_truth_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U5", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U6", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	predictions_0_V_read { ap_none {  { predictions_0_V_read in_data 0 16 } } }
	predictions_1_V_read { ap_none {  { predictions_1_V_read in_data 0 16 } } }
	ground_truth_V { ap_memory {  { ground_truth_V_address0 mem_address 1 1 }  { ground_truth_V_ce0 mem_ce 1 1 }  { ground_truth_V_q0 mem_dout 0 16 }  { ground_truth_V_address1 MemPortADDR2 1 1 }  { ground_truth_V_ce1 MemPortCE2 1 1 }  { ground_truth_V_q1 MemPortDOUT2 0 16 } } }
}
set moduleName mse_ap_fixed_16_6_0_0_0_mse_config_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mse<ap_fixed<16, 6, 0, 0, 0>, mse_config>}
set C_modelType { int 16 }
set C_modelArgList {
	{ predictions_0_V_read int 16 regular  }
	{ predictions_1_V_read int 1 regular  }
	{ ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "predictions_0_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "predictions_1_V_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 16} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ predictions_0_V_read sc_in sc_lv 16 signal 0 } 
	{ predictions_1_V_read sc_in sc_lv 1 signal 1 } 
	{ ground_truth_V_address0 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q0 sc_in sc_lv 16 signal 2 } 
	{ ground_truth_V_address1 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q1 sc_in sc_lv 16 signal 2 } 
	{ ap_return sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "predictions_0_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_0_V_read", "role": "default" }} , 
 	{ "name": "predictions_1_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "predictions_1_V_read", "role": "default" }} , 
 	{ "name": "ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address0" }} , 
 	{ "name": "ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce0" }} , 
 	{ "name": "ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q0" }} , 
 	{ "name": "ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address1" }} , 
 	{ "name": "ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce1" }} , 
 	{ "name": "ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "mse_ap_fixed_16_6_0_0_0_mse_config_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "predictions_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "predictions_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "ground_truth_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U3", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	predictions_0_V_read { ap_none {  { predictions_0_V_read in_data 0 16 } } }
	predictions_1_V_read { ap_none {  { predictions_1_V_read in_data 0 1 } } }
	ground_truth_V { ap_memory {  { ground_truth_V_address0 mem_address 1 1 }  { ground_truth_V_ce0 mem_ce 1 1 }  { ground_truth_V_q0 mem_dout 0 16 }  { ground_truth_V_address1 MemPortADDR2 1 1 }  { ground_truth_V_ce1 MemPortCE2 1 1 }  { ground_truth_V_q1 MemPortDOUT2 0 16 } } }
}
set moduleName mse_ap_fixed_16_6_0_0_0_mse_config_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mse<ap_fixed<16, 6, 0, 0, 0>, mse_config>}
set C_modelType { int 16 }
set C_modelArgList {
	{ predictions_0_V_read int 16 regular  }
	{ predictions_1_V_read int 1 regular  }
	{ ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "predictions_0_V_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "predictions_1_V_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 16} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ predictions_0_V_read sc_in sc_lv 16 signal 0 } 
	{ predictions_1_V_read sc_in sc_lv 1 signal 1 } 
	{ ground_truth_V_address0 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q0 sc_in sc_lv 16 signal 2 } 
	{ ground_truth_V_address1 sc_out sc_lv 1 signal 2 } 
	{ ground_truth_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ ground_truth_V_q1 sc_in sc_lv 16 signal 2 } 
	{ ap_return sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "predictions_0_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "predictions_0_V_read", "role": "default" }} , 
 	{ "name": "predictions_1_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "predictions_1_V_read", "role": "default" }} , 
 	{ "name": "ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address0" }} , 
 	{ "name": "ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce0" }} , 
 	{ "name": "ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q0" }} , 
 	{ "name": "ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "address1" }} , 
 	{ "name": "ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "ce1" }} , 
 	{ "name": "ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ground_truth_V", "role": "q1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "mse_ap_fixed_16_6_0_0_0_mse_config_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "predictions_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "predictions_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "ground_truth_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U3", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	predictions_0_V_read { ap_none {  { predictions_0_V_read in_data 0 16 } } }
	predictions_1_V_read { ap_none {  { predictions_1_V_read in_data 0 1 } } }
	ground_truth_V { ap_memory {  { ground_truth_V_address0 mem_address 1 1 }  { ground_truth_V_ce0 mem_ce 1 1 }  { ground_truth_V_q0 mem_dout 0 16 }  { ground_truth_V_address1 MemPortADDR2 1 1 }  { ground_truth_V_ce1 MemPortCE2 1 1 }  { ground_truth_V_q1 MemPortDOUT2 0 16 } } }
}
