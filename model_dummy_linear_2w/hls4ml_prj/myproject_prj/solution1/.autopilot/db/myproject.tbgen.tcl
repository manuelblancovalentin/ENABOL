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
	{ layer3_out_0_V int 16 regular {pointer 1}  }
	{ layer3_out_1_V int 16 regular {pointer 1}  }
	{ loss_layer3_out_V int 16 regular {pointer 1}  }
	{ const_size_in_1 int 16 regular {pointer 1}  }
	{ const_size_out_1 int 16 regular {pointer 1}  }
	{ layer3_out_ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
	{ train uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fc1_input_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "fc1_input.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "loss_layer3_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "loss_layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_in_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_out_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_out_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "layer3_out_ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out_ground_truth.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}]} , 
 	{ "Name" : "train", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "train","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fc1_input_V sc_in sc_lv 16 signal 0 } 
	{ fc1_input_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ layer3_out_0_V sc_out sc_lv 16 signal 1 } 
	{ layer3_out_0_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ layer3_out_1_V sc_out sc_lv 16 signal 2 } 
	{ layer3_out_1_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ loss_layer3_out_V sc_out sc_lv 16 signal 3 } 
	{ loss_layer3_out_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ const_size_in_1 sc_out sc_lv 16 signal 4 } 
	{ const_size_in_1_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ const_size_out_1 sc_out sc_lv 16 signal 5 } 
	{ const_size_out_1_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ layer3_out_ground_truth_V_address0 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q0 sc_in sc_lv 16 signal 6 } 
	{ layer3_out_ground_truth_V_address1 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce1 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q1 sc_in sc_lv 16 signal 6 } 
	{ train sc_in sc_logic 1 signal 7 } 
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
 	{ "name": "layer3_out_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_0_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_0_V", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_1_V", "role": "default" }} , 
 	{ "name": "layer3_out_1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_1_V", "role": "ap_vld" }} , 
 	{ "name": "loss_layer3_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loss_layer3_out_V", "role": "default" }} , 
 	{ "name": "loss_layer3_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loss_layer3_out_V", "role": "ap_vld" }} , 
 	{ "name": "const_size_in_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_in_1", "role": "default" }} , 
 	{ "name": "const_size_in_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_in_1", "role": "ap_vld" }} , 
 	{ "name": "const_size_out_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_out_1", "role": "default" }} , 
 	{ "name": "const_size_out_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_out_1", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address0" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce0" }} , 
 	{ "name": "layer3_out_ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q0" }} , 
 	{ "name": "layer3_out_ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address1" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce1" }} , 
 	{ "name": "layer3_out_ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q1" }} , 
 	{ "name": "train", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "train", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5", "6", "7", "8"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "8",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
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
			{"Name" : "layer3_out_0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_1_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "loss_layer3_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_in_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_out_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_ground_truth_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184", "Port" : "ground_truth_V"}]},
			{"Name" : "train", "Type" : "None", "Direction" : "I"},
			{"Name" : "w2_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_192", "Port" : "w2_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w2_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184", "Parent" : "0", "Child" : ["3", "4"],
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184.myproject_mul_mul_16s_16s_32_1_1_U5", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184.myproject_mul_mul_16s_16s_32_1_1_U6", "Parent" : "2"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_192", "Parent" : "0",
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
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s_fu_200", "Parent" : "0",
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
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U11", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U12", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		fc1_input_V {Type I LastRead 0 FirstWrite -1}
		layer3_out_0_V {Type O LastRead -1 FirstWrite 2}
		layer3_out_1_V {Type O LastRead -1 FirstWrite 2}
		loss_layer3_out_V {Type O LastRead -1 FirstWrite 6}
		const_size_in_1 {Type O LastRead -1 FirstWrite 2}
		const_size_out_1 {Type O LastRead -1 FirstWrite 2}
		layer3_out_ground_truth_V {Type I LastRead 1 FirstWrite -1}
		train {Type I LastRead 1 FirstWrite -1}
		w2_V {Type IO LastRead -1 FirstWrite -1}}
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config2_0_0_0 {
		data_V_read {Type I LastRead 1 FirstWrite -1}
		w2_V {Type I LastRead 1 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "8", "Max" : "8"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	fc1_input_V { ap_vld {  { fc1_input_V in_data 0 16 }  { fc1_input_V_ap_vld in_vld 0 1 } } }
	layer3_out_0_V { ap_vld {  { layer3_out_0_V out_data 1 16 }  { layer3_out_0_V_ap_vld out_vld 1 1 } } }
	layer3_out_1_V { ap_vld {  { layer3_out_1_V out_data 1 16 }  { layer3_out_1_V_ap_vld out_vld 1 1 } } }
	loss_layer3_out_V { ap_vld {  { loss_layer3_out_V out_data 1 16 }  { loss_layer3_out_V_ap_vld out_vld 1 1 } } }
	const_size_in_1 { ap_vld {  { const_size_in_1 out_data 1 16 }  { const_size_in_1_ap_vld out_vld 1 1 } } }
	const_size_out_1 { ap_vld {  { const_size_out_1 out_data 1 16 }  { const_size_out_1_ap_vld out_vld 1 1 } } }
	layer3_out_ground_truth_V { ap_memory {  { layer3_out_ground_truth_V_address0 mem_address 1 1 }  { layer3_out_ground_truth_V_ce0 mem_ce 1 1 }  { layer3_out_ground_truth_V_q0 mem_dout 0 16 }  { layer3_out_ground_truth_V_address1 MemPortADDR2 1 1 }  { layer3_out_ground_truth_V_ce1 MemPortCE2 1 1 }  { layer3_out_ground_truth_V_q1 MemPortDOUT2 0 16 } } }
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
	{ layer3_out_0_V int 16 regular {pointer 1}  }
	{ layer3_out_1_V int 16 regular {pointer 1}  }
	{ loss_layer3_out_V int 16 regular {pointer 1}  }
	{ const_size_in_1 int 16 regular {pointer 1}  }
	{ const_size_out_1 int 16 regular {pointer 1}  }
	{ layer3_out_ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
	{ train uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fc1_input_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "fc1_input.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "loss_layer3_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "loss_layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_in_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_out_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_out_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "layer3_out_ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out_ground_truth.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}]} , 
 	{ "Name" : "train", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "train","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fc1_input_V sc_in sc_lv 16 signal 0 } 
	{ fc1_input_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ layer3_out_0_V sc_out sc_lv 16 signal 1 } 
	{ layer3_out_0_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ layer3_out_1_V sc_out sc_lv 16 signal 2 } 
	{ layer3_out_1_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ loss_layer3_out_V sc_out sc_lv 16 signal 3 } 
	{ loss_layer3_out_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ const_size_in_1 sc_out sc_lv 16 signal 4 } 
	{ const_size_in_1_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ const_size_out_1 sc_out sc_lv 16 signal 5 } 
	{ const_size_out_1_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ layer3_out_ground_truth_V_address0 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q0 sc_in sc_lv 16 signal 6 } 
	{ layer3_out_ground_truth_V_address1 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce1 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q1 sc_in sc_lv 16 signal 6 } 
	{ train sc_in sc_logic 1 signal 7 } 
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
 	{ "name": "layer3_out_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_0_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_0_V", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_1_V", "role": "default" }} , 
 	{ "name": "layer3_out_1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_1_V", "role": "ap_vld" }} , 
 	{ "name": "loss_layer3_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loss_layer3_out_V", "role": "default" }} , 
 	{ "name": "loss_layer3_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loss_layer3_out_V", "role": "ap_vld" }} , 
 	{ "name": "const_size_in_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_in_1", "role": "default" }} , 
 	{ "name": "const_size_in_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_in_1", "role": "ap_vld" }} , 
 	{ "name": "const_size_out_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_out_1", "role": "default" }} , 
 	{ "name": "const_size_out_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_out_1", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address0" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce0" }} , 
 	{ "name": "layer3_out_ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q0" }} , 
 	{ "name": "layer3_out_ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address1" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce1" }} , 
 	{ "name": "layer3_out_ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q1" }} , 
 	{ "name": "train", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "train", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5", "6", "7", "8"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "8",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
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
			{"Name" : "layer3_out_0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_1_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "loss_layer3_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_in_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_out_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_ground_truth_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184", "Port" : "ground_truth_V"}]},
			{"Name" : "train", "Type" : "None", "Direction" : "I"},
			{"Name" : "w2_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_192", "Port" : "w2_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w2_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184", "Parent" : "0", "Child" : ["3", "4"],
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184.myproject_mul_mul_16s_16s_32_1_1_U5", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_184.myproject_mul_mul_16s_16s_32_1_1_U6", "Parent" : "2"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_192", "Parent" : "0",
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
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s_fu_200", "Parent" : "0",
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
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U11", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myproject_mul_mul_16s_16s_26_1_1_U12", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		fc1_input_V {Type I LastRead 0 FirstWrite -1}
		layer3_out_0_V {Type O LastRead -1 FirstWrite 2}
		layer3_out_1_V {Type O LastRead -1 FirstWrite 2}
		loss_layer3_out_V {Type O LastRead -1 FirstWrite 6}
		const_size_in_1 {Type O LastRead -1 FirstWrite 2}
		const_size_out_1 {Type O LastRead -1 FirstWrite 2}
		layer3_out_ground_truth_V {Type I LastRead 1 FirstWrite -1}
		train {Type I LastRead 1 FirstWrite -1}
		w2_V {Type IO LastRead -1 FirstWrite -1}}
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config2_0_0_0 {
		data_V_read {Type I LastRead 1 FirstWrite -1}
		w2_V {Type I LastRead 1 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "8", "Max" : "8"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	fc1_input_V { ap_vld {  { fc1_input_V in_data 0 16 }  { fc1_input_V_ap_vld in_vld 0 1 } } }
	layer3_out_0_V { ap_vld {  { layer3_out_0_V out_data 1 16 }  { layer3_out_0_V_ap_vld out_vld 1 1 } } }
	layer3_out_1_V { ap_vld {  { layer3_out_1_V out_data 1 16 }  { layer3_out_1_V_ap_vld out_vld 1 1 } } }
	loss_layer3_out_V { ap_vld {  { loss_layer3_out_V out_data 1 16 }  { loss_layer3_out_V_ap_vld out_vld 1 1 } } }
	const_size_in_1 { ap_vld {  { const_size_in_1 out_data 1 16 }  { const_size_in_1_ap_vld out_vld 1 1 } } }
	const_size_out_1 { ap_vld {  { const_size_out_1 out_data 1 16 }  { const_size_out_1_ap_vld out_vld 1 1 } } }
	layer3_out_ground_truth_V { ap_memory {  { layer3_out_ground_truth_V_address0 mem_address 1 1 }  { layer3_out_ground_truth_V_ce0 mem_ce 1 1 }  { layer3_out_ground_truth_V_q0 mem_dout 0 16 }  { layer3_out_ground_truth_V_address1 MemPortADDR2 1 1 }  { layer3_out_ground_truth_V_ce1 MemPortCE2 1 1 }  { layer3_out_ground_truth_V_q1 MemPortDOUT2 0 16 } } }
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
set moduleName myproject
set isTopModule 1
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
set C_modelName {myproject}
set C_modelType { void 0 }
set C_modelArgList {
	{ fc1_input_V int 16 regular {pointer 0}  }
	{ layer3_out_0_V int 16 regular {pointer 1}  }
	{ layer3_out_1_V int 16 regular {pointer 1}  }
	{ loss_layer3_out_V int 16 regular {pointer 1}  }
	{ const_size_in_1 int 16 regular {pointer 1}  }
	{ const_size_out_1 int 16 regular {pointer 1}  }
	{ layer3_out_ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
	{ train uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fc1_input_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "fc1_input.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "loss_layer3_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "loss_layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_in_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_out_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_out_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "layer3_out_ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out_ground_truth.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}]} , 
 	{ "Name" : "train", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "train","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fc1_input_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ fc1_input_V sc_in sc_lv 16 signal 0 } 
	{ layer3_out_0_V sc_out sc_lv 16 signal 1 } 
	{ layer3_out_0_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ layer3_out_1_V sc_out sc_lv 16 signal 2 } 
	{ layer3_out_1_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ loss_layer3_out_V sc_out sc_lv 16 signal 3 } 
	{ loss_layer3_out_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ const_size_in_1 sc_out sc_lv 16 signal 4 } 
	{ const_size_in_1_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ const_size_out_1 sc_out sc_lv 16 signal 5 } 
	{ const_size_out_1_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ layer3_out_ground_truth_V_address0 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q0 sc_in sc_lv 16 signal 6 } 
	{ layer3_out_ground_truth_V_address1 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce1 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q1 sc_in sc_lv 16 signal 6 } 
	{ train sc_in sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fc1_input_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "fc1_input_V", "role": "ap_vld" }} , 
 	{ "name": "fc1_input_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fc1_input_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_0_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_0_V", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_1_V", "role": "default" }} , 
 	{ "name": "layer3_out_1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_1_V", "role": "ap_vld" }} , 
 	{ "name": "loss_layer3_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loss_layer3_out_V", "role": "default" }} , 
 	{ "name": "loss_layer3_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loss_layer3_out_V", "role": "ap_vld" }} , 
 	{ "name": "const_size_in_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_in_1", "role": "default" }} , 
 	{ "name": "const_size_in_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_in_1", "role": "ap_vld" }} , 
 	{ "name": "const_size_out_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_out_1", "role": "default" }} , 
 	{ "name": "const_size_out_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_out_1", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address0" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce0" }} , 
 	{ "name": "layer3_out_ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q0" }} , 
 	{ "name": "layer3_out_ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address1" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce1" }} , 
 	{ "name": "layer3_out_ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q1" }} , 
 	{ "name": "train", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "train", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "5"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
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
			{"Name" : "layer3_out_0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_1_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "loss_layer3_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_in_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_out_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_ground_truth_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120", "Port" : "ground_truth_V"}]},
			{"Name" : "train", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120", "Parent" : "0", "Child" : ["2", "3"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120.myproject_mul_mul_16s_16s_32_1_1_U3", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120.myproject_mul_mul_16s_16s_32_1_1_U4", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer2_out_0_V_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_130", "Parent" : "0",
		"CDFG" : "dense_latency_ap_fixed_ap_fixed_config2_0_0_0",
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
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s_fu_136", "Parent" : "0",
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
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		fc1_input_V {Type I LastRead 0 FirstWrite -1}
		layer3_out_0_V {Type O LastRead -1 FirstWrite 4}
		layer3_out_1_V {Type O LastRead -1 FirstWrite 4}
		loss_layer3_out_V {Type O LastRead -1 FirstWrite 4}
		const_size_in_1 {Type O LastRead -1 FirstWrite 4}
		const_size_out_1 {Type O LastRead -1 FirstWrite 4}
		layer3_out_ground_truth_V {Type I LastRead 1 FirstWrite -1}
		train {Type I LastRead 0 FirstWrite -1}}
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config2_0_0_0 {
		data_V_read {Type I LastRead 0 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	fc1_input_V { ap_vld {  { fc1_input_V_ap_vld in_vld 0 1 }  { fc1_input_V in_data 0 16 } } }
	layer3_out_0_V { ap_vld {  { layer3_out_0_V out_data 1 16 }  { layer3_out_0_V_ap_vld out_vld 1 1 } } }
	layer3_out_1_V { ap_vld {  { layer3_out_1_V out_data 1 16 }  { layer3_out_1_V_ap_vld out_vld 1 1 } } }
	loss_layer3_out_V { ap_vld {  { loss_layer3_out_V out_data 1 16 }  { loss_layer3_out_V_ap_vld out_vld 1 1 } } }
	const_size_in_1 { ap_vld {  { const_size_in_1 out_data 1 16 }  { const_size_in_1_ap_vld out_vld 1 1 } } }
	const_size_out_1 { ap_vld {  { const_size_out_1 out_data 1 16 }  { const_size_out_1_ap_vld out_vld 1 1 } } }
	layer3_out_ground_truth_V { ap_memory {  { layer3_out_ground_truth_V_address0 mem_address 1 1 }  { layer3_out_ground_truth_V_ce0 mem_ce 1 1 }  { layer3_out_ground_truth_V_q0 mem_dout 0 16 }  { layer3_out_ground_truth_V_address1 MemPortADDR2 1 1 }  { layer3_out_ground_truth_V_ce1 MemPortCE2 1 1 }  { layer3_out_ground_truth_V_q1 MemPortDOUT2 0 16 } } }
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
set moduleName myproject
set isTopModule 1
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
set C_modelName {myproject}
set C_modelType { void 0 }
set C_modelArgList {
	{ fc1_input_V int 16 regular {pointer 0}  }
	{ layer3_out_0_V int 16 regular {pointer 1}  }
	{ layer3_out_1_V int 16 regular {pointer 1}  }
	{ loss_layer3_out_V int 16 regular {pointer 1}  }
	{ const_size_in_1 int 16 regular {pointer 1}  }
	{ const_size_out_1 int 16 regular {pointer 1}  }
	{ layer3_out_ground_truth_V int 16 regular {array 2 { 1 1 } 1 1 }  }
	{ train uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fc1_input_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "fc1_input.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_0_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "layer3_out_1_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "loss_layer3_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "loss_layer3_out.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_in_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "const_size_out_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "const_size_out_1","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "layer3_out_ground_truth_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "layer3_out_ground_truth.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}]} , 
 	{ "Name" : "train", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "train","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fc1_input_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ fc1_input_V sc_in sc_lv 16 signal 0 } 
	{ layer3_out_0_V sc_out sc_lv 16 signal 1 } 
	{ layer3_out_0_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ layer3_out_1_V sc_out sc_lv 16 signal 2 } 
	{ layer3_out_1_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ loss_layer3_out_V sc_out sc_lv 16 signal 3 } 
	{ loss_layer3_out_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ const_size_in_1 sc_out sc_lv 16 signal 4 } 
	{ const_size_in_1_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ const_size_out_1 sc_out sc_lv 16 signal 5 } 
	{ const_size_out_1_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ layer3_out_ground_truth_V_address0 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q0 sc_in sc_lv 16 signal 6 } 
	{ layer3_out_ground_truth_V_address1 sc_out sc_lv 1 signal 6 } 
	{ layer3_out_ground_truth_V_ce1 sc_out sc_logic 1 signal 6 } 
	{ layer3_out_ground_truth_V_q1 sc_in sc_lv 16 signal 6 } 
	{ train sc_in sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fc1_input_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "fc1_input_V", "role": "ap_vld" }} , 
 	{ "name": "fc1_input_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fc1_input_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_0_V", "role": "default" }} , 
 	{ "name": "layer3_out_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_0_V", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_1_V", "role": "default" }} , 
 	{ "name": "layer3_out_1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer3_out_1_V", "role": "ap_vld" }} , 
 	{ "name": "loss_layer3_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "loss_layer3_out_V", "role": "default" }} , 
 	{ "name": "loss_layer3_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loss_layer3_out_V", "role": "ap_vld" }} , 
 	{ "name": "const_size_in_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_in_1", "role": "default" }} , 
 	{ "name": "const_size_in_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_in_1", "role": "ap_vld" }} , 
 	{ "name": "const_size_out_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "const_size_out_1", "role": "default" }} , 
 	{ "name": "const_size_out_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "const_size_out_1", "role": "ap_vld" }} , 
 	{ "name": "layer3_out_ground_truth_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address0" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce0" }} , 
 	{ "name": "layer3_out_ground_truth_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q0" }} , 
 	{ "name": "layer3_out_ground_truth_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "address1" }} , 
 	{ "name": "layer3_out_ground_truth_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "ce1" }} , 
 	{ "name": "layer3_out_ground_truth_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer3_out_ground_truth_V", "role": "q1" }} , 
 	{ "name": "train", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "train", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "5"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
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
			{"Name" : "layer3_out_0_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_1_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "loss_layer3_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_in_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "const_size_out_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layer3_out_ground_truth_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120", "Port" : "ground_truth_V"}]},
			{"Name" : "train", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120", "Parent" : "0", "Child" : ["2", "3"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120.myproject_mul_mul_16s_16s_32_1_1_U3", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mse_ap_fixed_16_6_0_0_0_mse_config_s_fu_120.myproject_mul_mul_16s_16s_32_1_1_U4", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer2_out_0_V_dense_latency_ap_fixed_ap_fixed_config2_0_0_0_fu_130", "Parent" : "0",
		"CDFG" : "dense_latency_ap_fixed_ap_fixed_config2_0_0_0",
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
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s_fu_136", "Parent" : "0",
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
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		fc1_input_V {Type I LastRead 0 FirstWrite -1}
		layer3_out_0_V {Type O LastRead -1 FirstWrite 4}
		layer3_out_1_V {Type O LastRead -1 FirstWrite 4}
		loss_layer3_out_V {Type O LastRead -1 FirstWrite 4}
		const_size_in_1 {Type O LastRead -1 FirstWrite 4}
		const_size_out_1 {Type O LastRead -1 FirstWrite 4}
		layer3_out_ground_truth_V {Type I LastRead 1 FirstWrite -1}
		train {Type I LastRead 0 FirstWrite -1}}
	mse_ap_fixed_16_6_0_0_0_mse_config_s {
		predictions_0_V_read {Type I LastRead 0 FirstWrite -1}
		predictions_1_V_read {Type I LastRead 0 FirstWrite -1}
		ground_truth_V {Type I LastRead 1 FirstWrite -1}}
	dense_latency_ap_fixed_ap_fixed_config2_0_0_0 {
		data_V_read {Type I LastRead 0 FirstWrite -1}}
	linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	fc1_input_V { ap_vld {  { fc1_input_V_ap_vld in_vld 0 1 }  { fc1_input_V in_data 0 16 } } }
	layer3_out_0_V { ap_vld {  { layer3_out_0_V out_data 1 16 }  { layer3_out_0_V_ap_vld out_vld 1 1 } } }
	layer3_out_1_V { ap_vld {  { layer3_out_1_V out_data 1 16 }  { layer3_out_1_V_ap_vld out_vld 1 1 } } }
	loss_layer3_out_V { ap_vld {  { loss_layer3_out_V out_data 1 16 }  { loss_layer3_out_V_ap_vld out_vld 1 1 } } }
	const_size_in_1 { ap_vld {  { const_size_in_1 out_data 1 16 }  { const_size_in_1_ap_vld out_vld 1 1 } } }
	const_size_out_1 { ap_vld {  { const_size_out_1 out_data 1 16 }  { const_size_out_1_ap_vld out_vld 1 1 } } }
	layer3_out_ground_truth_V { ap_memory {  { layer3_out_ground_truth_V_address0 mem_address 1 1 }  { layer3_out_ground_truth_V_ce0 mem_ce 1 1 }  { layer3_out_ground_truth_V_q0 mem_dout 0 16 }  { layer3_out_ground_truth_V_address1 MemPortADDR2 1 1 }  { layer3_out_ground_truth_V_ce1 MemPortCE2 1 1 }  { layer3_out_ground_truth_V_q1 MemPortDOUT2 0 16 } } }
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
