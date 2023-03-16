set moduleName myproject
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {myproject}
set C_modelType { void 0 }
set C_modelArgList {
	{ fc1_input_V int 16 regular {pointer 0}  }
	{ layer5_out_0_V int 16 regular {pointer 1}  }
	{ loss_layer5_out_V int 16 regular {pointer 1}  }
	{ const_size_in_1 int 16 regular {pointer 1}  }
	{ const_size_out_1 int 16 regular {pointer 1}  }
	{ layer5_out_ground_truth_V int 16 regular {array 1 { 1 3 } 1 1 }  }
	{ train uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fc1_input_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "fc1_input.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer5_out_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer5_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "loss_layer5_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "loss_layer5_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_in_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_out_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_out_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "layer5_out_ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer5_out_ground_truth.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "train", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "train","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fc1_input_V sc_in sc_lv 16 signal 0 } 
	{ fc1_input_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ layer5_out_0_V sc_out sc_lv 16 signal 1 } 
	{ layer5_out_0_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ loss_layer5_out_V sc_out sc_lv 16 signal 2 } 
	{ loss_layer5_out_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ const_size_in_1 sc_out sc_lv 16 signal 3 } 
	{ const_size_in_1_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ const_size_out_1 sc_out sc_lv 16 signal 4 } 
	{ const_size_out_1_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ layer5_out_ground_truth_V_address0 sc_out sc_lv 1 signal 5 } 
	{ layer5_out_ground_truth_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ layer5_out_ground_truth_V_q0 sc_in sc_lv 16 signal 5 } 
	{ train sc_in sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fc1_input_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fc1_input_V", "role": "default" }} , 
 	{ "name": "fc1_input_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "fc1_input_V", "role": "ap_vld" }} , 
 	{ "name": "layer5_out_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer5_out_0_V", "role": "default" }} , 
 	{ "name": "layer5_out_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer5_out_0_V", "role": "ap_vld" }} , 
 	{ "name": "loss_layer5_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loss_layer5_out_V", "role": "default" }} , 
 	{ "name": "loss_layer5_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loss_layer5_out_V", "role": "ap_vld" }} , 
 	{ "name": "const_size_in_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_in_1", "role": "default" }} , 
 	{ "name": "const_size_in_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_in_1", "role": "ap_vld" }} , 
 	{ "name": "const_size_out_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_out_1", "role": "default" }} , 
 	{ "name": "const_size_out_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_out_1", "role": "ap_vld" }} , 
 	{ "name": "layer5_out_ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer5_out_ground_truth_V", "role": "address0" }} , 
 	{ "name": "layer5_out_ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer5_out_ground_truth_V", "role": "ce0" }} , 
 	{ "name": "layer5_out_ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer5_out_ground_truth_V", "role": "q0" }} , 
 	{ "name": "train", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "train", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "10",
		"VariableLatency" : "0", "ExactLatency" : "9", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "9",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "fc1_input_V", "Type" : "Vld", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fc1_input_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer5_out_0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "loss_layer5_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_in_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_out_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer5_out_ground_truth_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "train", "Type" : "None", "Direction" : "I"},
			{"Name" : "w2_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_249", "Port" : "w2_V"}]},
			{"Name" : "w4_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_dense_latency_ap_fixed_ap_fixed_config4_0_0_fu_241", "Port" : "w4_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w2_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w4_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dense_latency_ap_fixed_ap_fixed_config4_0_0_fu_241", "Parent" : "0",
		"CDFG" : "dense_latency_ap_fixed_ap_fixed_config4_0_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "w4_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_249", "Parent" : "0",
		"CDFG" : "dense_latency_ap_fixed_ap_fixed_config2_0_0_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "2",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "w2_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s_fu_257", "Parent" : "0",
		"CDFG" : "linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_Val2_1_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config5_s_fu_263", "Parent" : "0",
		"CDFG" : "linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config5_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U9", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U10", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_32_1_1_U11", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U12", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U13", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		fc1_input_V {Type I LastRead 0 FirstWrite -1}
		layer5_out_0_V {Type O LastRead -1 FirstWrite 4}
		loss_layer5_out_V {Type O LastRead -1 FirstWrite 7}
		const_size_in_1 {Type O LastRead -1 FirstWrite 4}
		const_size_out_1 {Type O LastRead -1 FirstWrite 4}
		layer5_out_ground_truth_V {Type I LastRead 0 FirstWrite -1}
		train {Type I LastRead 0 FirstWrite -1}
		w2_V {Type IO LastRead -1 FirstWrite -1}
		w4_V {Type IO LastRead -1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config4_0_0 {
		data_0_V_read {Type I LastRead 1 FirstWrite -1}
		data_1_V_read {Type I LastRead 1 FirstWrite -1}
		w4_V {Type I LastRead 1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config2_0_0_0 {
		data_V_read {Type I LastRead 1 FirstWrite -1}
		w2_V {Type I LastRead 1 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config5_s {
		data_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9", "Max" : "9"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	fc1_input_V { ap_vld {  { fc1_input_V in_data 0 16 }  { fc1_input_V_ap_vld in_vld 0 1 } } }
	layer5_out_0_V { ap_vld {  { layer5_out_0_V out_data 1 16 }  { layer5_out_0_V_ap_vld out_vld 1 1 } } }
	loss_layer5_out_V { ap_vld {  { loss_layer5_out_V out_data 1 16 }  { loss_layer5_out_V_ap_vld out_vld 1 1 } } }
	const_size_in_1 { ap_vld {  { const_size_in_1 out_data 1 16 }  { const_size_in_1_ap_vld out_vld 1 1 } } }
	const_size_out_1 { ap_vld {  { const_size_out_1 out_data 1 16 }  { const_size_out_1_ap_vld out_vld 1 1 } } }
	layer5_out_ground_truth_V { ap_memory {  { layer5_out_ground_truth_V_address0 mem_address 1 1 }  { layer5_out_ground_truth_V_ce0 mem_ce 1 1 }  { layer5_out_ground_truth_V_q0 mem_dout 0 16 } } }
	train { ap_none {  { train in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
