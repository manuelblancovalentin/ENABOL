// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#define AP_INT_MAX_W 32678

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
extern ap_fixed<6, 1, (ap_q_mode) 5, (ap_o_mode)3, 0> w2[2];



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "fc1_input_V"
#define AUTOTB_TVIN_fc1_input_V  "../tv/cdatafile/c.myproject.autotvin_fc1_input_V.dat"
// wrapc file define: "layer3_out_0_V"
#define AUTOTB_TVOUT_layer3_out_0_V  "../tv/cdatafile/c.myproject.autotvout_layer3_out_0_V.dat"
// wrapc file define: "layer3_out_1_V"
#define AUTOTB_TVOUT_layer3_out_1_V  "../tv/cdatafile/c.myproject.autotvout_layer3_out_1_V.dat"
// wrapc file define: "loss_layer3_out_V"
#define AUTOTB_TVOUT_loss_layer3_out_V  "../tv/cdatafile/c.myproject.autotvout_loss_layer3_out_V.dat"
// wrapc file define: "const_size_in_1"
#define AUTOTB_TVOUT_const_size_in_1  "../tv/cdatafile/c.myproject.autotvout_const_size_in_1.dat"
// wrapc file define: "const_size_out_1"
#define AUTOTB_TVOUT_const_size_out_1  "../tv/cdatafile/c.myproject.autotvout_const_size_out_1.dat"
// wrapc file define: "layer3_out_ground_truth_V"
#define AUTOTB_TVIN_layer3_out_ground_truth_V  "../tv/cdatafile/c.myproject.autotvin_layer3_out_ground_truth_V.dat"
// wrapc file define: "train"
#define AUTOTB_TVIN_train  "../tv/cdatafile/c.myproject.autotvin_train.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "layer3_out_0_V"
#define AUTOTB_TVOUT_PC_layer3_out_0_V  "../tv/rtldatafile/rtl.myproject.autotvout_layer3_out_0_V.dat"
// tvout file define: "layer3_out_1_V"
#define AUTOTB_TVOUT_PC_layer3_out_1_V  "../tv/rtldatafile/rtl.myproject.autotvout_layer3_out_1_V.dat"
// tvout file define: "loss_layer3_out_V"
#define AUTOTB_TVOUT_PC_loss_layer3_out_V  "../tv/rtldatafile/rtl.myproject.autotvout_loss_layer3_out_V.dat"
// tvout file define: "const_size_in_1"
#define AUTOTB_TVOUT_PC_const_size_in_1  "../tv/rtldatafile/rtl.myproject.autotvout_const_size_in_1.dat"
// tvout file define: "const_size_out_1"
#define AUTOTB_TVOUT_PC_const_size_out_1  "../tv/rtldatafile/rtl.myproject.autotvout_const_size_out_1.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			fc1_input_V_depth = 0;
			layer3_out_0_V_depth = 0;
			layer3_out_1_V_depth = 0;
			loss_layer3_out_V_depth = 0;
			const_size_in_1_depth = 0;
			const_size_out_1_depth = 0;
			layer3_out_ground_truth_V_depth = 0;
			train_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{fc1_input_V " << fc1_input_V_depth << "}\n";
			total_list << "{layer3_out_0_V " << layer3_out_0_V_depth << "}\n";
			total_list << "{layer3_out_1_V " << layer3_out_1_V_depth << "}\n";
			total_list << "{loss_layer3_out_V " << loss_layer3_out_V_depth << "}\n";
			total_list << "{const_size_in_1 " << const_size_in_1_depth << "}\n";
			total_list << "{const_size_out_1 " << const_size_out_1_depth << "}\n";
			total_list << "{layer3_out_ground_truth_V " << layer3_out_ground_truth_V_depth << "}\n";
			total_list << "{train " << train_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int fc1_input_V_depth;
		int layer3_out_0_V_depth;
		int layer3_out_1_V_depth;
		int loss_layer3_out_V_depth;
		int const_size_in_1_depth;
		int const_size_out_1_depth;
		int layer3_out_ground_truth_V_depth;
		int train_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void myproject (
ap_fixed<16, 6, (ap_q_mode) 5, (ap_o_mode)3, 0> fc1_input[1],
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> layer3_out[2],
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> (&loss_layer3_out),
unsigned short (&const_size_in_1),
unsigned short (&const_size_out_1),
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> layer3_out_ground_truth[2],
bool train);

void AESL_WRAP_myproject (
ap_fixed<16, 6, (ap_q_mode) 5, (ap_o_mode)3, 0> fc1_input[1],
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> layer3_out[2],
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> (&loss_layer3_out),
unsigned short (&const_size_in_1),
unsigned short (&const_size_out_1),
ap_fixed<16, 6, (ap_q_mode) 0, (ap_o_mode)0, 0> layer3_out_ground_truth[2],
bool train)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "layer3_out_0_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_0_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_0_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_0_V, AESL_token); // data

			sc_bv<16> *layer3_out_0_V_pc_buffer = new sc_bv<16>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'layer3_out_0_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'layer3_out_0_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					layer3_out_0_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_0_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_layer3_out_0_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: layer3_out_0_V
				{
					// bitslice(15, 0)
					// {
						// celement: layer3_out.V(15, 0)
						// {
							sc_lv<16>* layer3_out_V_lv0_0_0_2 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: layer3_out.V(15, 0)
						{
							// carray: (0) => (0) @ (2)
							for (int i_0 = 0; i_0 <= 0; i_0 += 2)
							{
								if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
								{
									layer3_out_V_lv0_0_0_2[hls_map_index].range(15, 0) = sc_bv<16>(layer3_out_0_V_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: layer3_out.V(15, 0)
						{
							// carray: (0) => (0) @ (2)
							for (int i_0 = 0; i_0 <= 0; i_0 += 2)
							{
								// sub                    : i_0
								// ori_name               : layer3_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : layer3_out[0]
								// output_left_conversion : (layer3_out[i_0]).range()
								// output_type_conversion : (layer3_out_V_lv0_0_0_2[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
								{
									(layer3_out[i_0]).range() = (layer3_out_V_lv0_0_0_2[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] layer3_out_0_V_pc_buffer;
		}

		// output port post check: "layer3_out_1_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_1_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_1_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_1_V, AESL_token); // data

			sc_bv<16> *layer3_out_1_V_pc_buffer = new sc_bv<16>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'layer3_out_1_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'layer3_out_1_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					layer3_out_1_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_layer3_out_1_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_layer3_out_1_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: layer3_out_1_V
				{
					// bitslice(15, 0)
					// {
						// celement: layer3_out.V(15, 0)
						// {
							sc_lv<16>* layer3_out_V_lv0_1_1_2 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: layer3_out.V(15, 0)
						{
							// carray: (1) => (1) @ (2)
							for (int i_0 = 1; i_0 <= 1; i_0 += 2)
							{
								if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
								{
									layer3_out_V_lv0_1_1_2[hls_map_index].range(15, 0) = sc_bv<16>(layer3_out_1_V_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: layer3_out.V(15, 0)
						{
							// carray: (1) => (1) @ (2)
							for (int i_0 = 1; i_0 <= 1; i_0 += 2)
							{
								// sub                    : i_0
								// ori_name               : layer3_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : layer3_out[0]
								// output_left_conversion : (layer3_out[i_0]).range()
								// output_type_conversion : (layer3_out_V_lv0_1_1_2[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
								{
									(layer3_out[i_0]).range() = (layer3_out_V_lv0_1_1_2[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] layer3_out_1_V_pc_buffer;
		}

		// output port post check: "loss_layer3_out_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_loss_layer3_out_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_loss_layer3_out_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_loss_layer3_out_V, AESL_token); // data

			sc_bv<16> *loss_layer3_out_V_pc_buffer = new sc_bv<16>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'loss_layer3_out_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'loss_layer3_out_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					loss_layer3_out_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_loss_layer3_out_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_loss_layer3_out_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: loss_layer3_out_V
				{
					// bitslice(15, 0)
					// {
						// celement: loss_layer3_out.V(15, 0)
						// {
							sc_lv<16>* loss_layer3_out_V_lv0_0_0_1 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: loss_layer3_out.V(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(loss_layer3_out) != NULL) // check the null address if the c port is array or others
								{
									loss_layer3_out_V_lv0_0_0_1[hls_map_index].range(15, 0) = sc_bv<16>(loss_layer3_out_V_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: loss_layer3_out.V(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : loss_layer3_out
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : loss_layer3_out
								// output_left_conversion : (loss_layer3_out).range()
								// output_type_conversion : (loss_layer3_out_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(loss_layer3_out) != NULL) // check the null address if the c port is array or others
								{
									(loss_layer3_out).range() = (loss_layer3_out_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] loss_layer3_out_V_pc_buffer;
		}

		// output port post check: "const_size_in_1"
		aesl_fh.read(AUTOTB_TVOUT_PC_const_size_in_1, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_const_size_in_1, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_const_size_in_1, AESL_token); // data

			sc_bv<16> *const_size_in_1_pc_buffer = new sc_bv<16>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'const_size_in_1', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'const_size_in_1', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					const_size_in_1_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_const_size_in_1, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_const_size_in_1))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: const_size_in_1
				{
					// bitslice(15, 0)
					// {
						// celement: const_size_in_1(15, 0)
						// {
							sc_lv<16>* const_size_in_1_lv0_0_0_1 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: const_size_in_1(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(const_size_in_1) != NULL) // check the null address if the c port is array or others
								{
									const_size_in_1_lv0_0_0_1[hls_map_index].range(15, 0) = sc_bv<16>(const_size_in_1_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: const_size_in_1(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : const_size_in_1
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : const_size_in_1
								// output_left_conversion : const_size_in_1
								// output_type_conversion : (const_size_in_1_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(const_size_in_1) != NULL) // check the null address if the c port is array or others
								{
									const_size_in_1 = (const_size_in_1_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] const_size_in_1_pc_buffer;
		}

		// output port post check: "const_size_out_1"
		aesl_fh.read(AUTOTB_TVOUT_PC_const_size_out_1, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_const_size_out_1, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_const_size_out_1, AESL_token); // data

			sc_bv<16> *const_size_out_1_pc_buffer = new sc_bv<16>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'const_size_out_1', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'const_size_out_1', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					const_size_out_1_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_const_size_out_1, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_const_size_out_1))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: const_size_out_1
				{
					// bitslice(15, 0)
					// {
						// celement: const_size_out_1(15, 0)
						// {
							sc_lv<16>* const_size_out_1_lv0_0_0_1 = new sc_lv<16>[1];
						// }
					// }

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: const_size_out_1(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(const_size_out_1) != NULL) // check the null address if the c port is array or others
								{
									const_size_out_1_lv0_0_0_1[hls_map_index].range(15, 0) = sc_bv<16>(const_size_out_1_pc_buffer[hls_map_index].range(15, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(15, 0)
					{
						int hls_map_index = 0;
						// celement: const_size_out_1(15, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : const_size_out_1
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : const_size_out_1
								// output_left_conversion : const_size_out_1
								// output_type_conversion : (const_size_out_1_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(const_size_out_1) != NULL) // check the null address if the c port is array or others
								{
									const_size_out_1 = (const_size_out_1_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] const_size_out_1_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "fc1_input_V"
		char* tvin_fc1_input_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_fc1_input_V);

		// "layer3_out_0_V"
		char* tvout_layer3_out_0_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_layer3_out_0_V);

		// "layer3_out_1_V"
		char* tvout_layer3_out_1_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_layer3_out_1_V);

		// "loss_layer3_out_V"
		char* tvout_loss_layer3_out_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_loss_layer3_out_V);

		// "const_size_in_1"
		char* tvout_const_size_in_1 = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_const_size_in_1);

		// "const_size_out_1"
		char* tvout_const_size_out_1 = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_const_size_out_1);

		// "layer3_out_ground_truth_V"
		char* tvin_layer3_out_ground_truth_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_layer3_out_ground_truth_V);

		// "train"
		char* tvin_train = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_train);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_fc1_input_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_fc1_input_V, tvin_fc1_input_V);

		sc_bv<16>* fc1_input_V_tvin_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: fc1_input_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: fc1_input.V(15, 0)
				{
					// carray: (0) => (0) @ (2)
					for (int i_0 = 0; i_0 <= 0; i_0 += 2)
					{
						// sub                   : i_0
						// ori_name              : fc1_input[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : fc1_input[0]
						// regulate_c_name       : fc1_input_V
						// input_type_conversion : (fc1_input[i_0]).range().to_string(SC_BIN).c_str()
						if (&(fc1_input[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> fc1_input_V_tmp_mem;
							fc1_input_V_tmp_mem = (fc1_input[i_0]).range().to_string(SC_BIN).c_str();
							fc1_input_V_tvin_wrapc_buffer[hls_map_index].range(15, 0) = fc1_input_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_fc1_input_V, "%s\n", (fc1_input_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_fc1_input_V, tvin_fc1_input_V);
		}

		tcl_file.set_num(1, &tcl_file.fc1_input_V_depth);
		sprintf(tvin_fc1_input_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_fc1_input_V, tvin_fc1_input_V);

		// release memory allocation
		delete [] fc1_input_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_layer3_out_ground_truth_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_layer3_out_ground_truth_V, tvin_layer3_out_ground_truth_V);

		sc_bv<16>* layer3_out_ground_truth_V_tvin_wrapc_buffer = new sc_bv<16>[2];

		// RTL Name: layer3_out_ground_truth_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: layer3_out_ground_truth.V(15, 0)
				{
					// carray: (0) => (1) @ (1)
					for (int i_0 = 0; i_0 <= 1; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : layer3_out_ground_truth[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : layer3_out_ground_truth[0]
						// regulate_c_name       : layer3_out_ground_truth_V
						// input_type_conversion : (layer3_out_ground_truth[i_0]).range().to_string(SC_BIN).c_str()
						if (&(layer3_out_ground_truth[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> layer3_out_ground_truth_V_tmp_mem;
							layer3_out_ground_truth_V_tmp_mem = (layer3_out_ground_truth[i_0]).range().to_string(SC_BIN).c_str();
							layer3_out_ground_truth_V_tvin_wrapc_buffer[hls_map_index].range(15, 0) = layer3_out_ground_truth_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 2; i++)
		{
			sprintf(tvin_layer3_out_ground_truth_V, "%s\n", (layer3_out_ground_truth_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_layer3_out_ground_truth_V, tvin_layer3_out_ground_truth_V);
		}

		tcl_file.set_num(2, &tcl_file.layer3_out_ground_truth_V_depth);
		sprintf(tvin_layer3_out_ground_truth_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_layer3_out_ground_truth_V, tvin_layer3_out_ground_truth_V);

		// release memory allocation
		delete [] layer3_out_ground_truth_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_train, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_train, tvin_train);

		sc_bv<1> train_tvin_wrapc_buffer;

		// RTL Name: train
		{
			// bitslice(0, 0)
			{
				// celement: train(0, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : train
						// sub_1st_elem          : 
						// ori_name_1st_elem     : train
						// regulate_c_name       : train
						// input_type_conversion : train
						if (&(train) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> train_tmp_mem;
							train_tmp_mem = train;
							train_tvin_wrapc_buffer.range(0, 0) = train_tmp_mem.range(0, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_train, "%s\n", (train_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_train, tvin_train);
		}

		tcl_file.set_num(1, &tcl_file.train_depth);
		sprintf(tvin_train, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_train, tvin_train);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		myproject(fc1_input, layer3_out, loss_layer3_out, const_size_in_1, const_size_out_1, layer3_out_ground_truth, train);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_layer3_out_0_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_layer3_out_0_V, tvout_layer3_out_0_V);

		sc_bv<16>* layer3_out_0_V_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: layer3_out_0_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: layer3_out.V(15, 0)
				{
					// carray: (0) => (0) @ (2)
					for (int i_0 = 0; i_0 <= 0; i_0 += 2)
					{
						// sub                   : i_0
						// ori_name              : layer3_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : layer3_out[0]
						// regulate_c_name       : layer3_out_V
						// input_type_conversion : (layer3_out[i_0]).range().to_string(SC_BIN).c_str()
						if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> layer3_out_V_tmp_mem;
							layer3_out_V_tmp_mem = (layer3_out[i_0]).range().to_string(SC_BIN).c_str();
							layer3_out_0_V_tvout_wrapc_buffer[hls_map_index].range(15, 0) = layer3_out_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_layer3_out_0_V, "%s\n", (layer3_out_0_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_layer3_out_0_V, tvout_layer3_out_0_V);
		}

		tcl_file.set_num(1, &tcl_file.layer3_out_0_V_depth);
		sprintf(tvout_layer3_out_0_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_layer3_out_0_V, tvout_layer3_out_0_V);

		// release memory allocation
		delete [] layer3_out_0_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_layer3_out_1_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_layer3_out_1_V, tvout_layer3_out_1_V);

		sc_bv<16>* layer3_out_1_V_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: layer3_out_1_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: layer3_out.V(15, 0)
				{
					// carray: (1) => (1) @ (2)
					for (int i_0 = 1; i_0 <= 1; i_0 += 2)
					{
						// sub                   : i_0
						// ori_name              : layer3_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : layer3_out[0]
						// regulate_c_name       : layer3_out_V
						// input_type_conversion : (layer3_out[i_0]).range().to_string(SC_BIN).c_str()
						if (&(layer3_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> layer3_out_V_tmp_mem;
							layer3_out_V_tmp_mem = (layer3_out[i_0]).range().to_string(SC_BIN).c_str();
							layer3_out_1_V_tvout_wrapc_buffer[hls_map_index].range(15, 0) = layer3_out_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_layer3_out_1_V, "%s\n", (layer3_out_1_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_layer3_out_1_V, tvout_layer3_out_1_V);
		}

		tcl_file.set_num(1, &tcl_file.layer3_out_1_V_depth);
		sprintf(tvout_layer3_out_1_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_layer3_out_1_V, tvout_layer3_out_1_V);

		// release memory allocation
		delete [] layer3_out_1_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_loss_layer3_out_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_loss_layer3_out_V, tvout_loss_layer3_out_V);

		sc_bv<16>* loss_layer3_out_V_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: loss_layer3_out_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: loss_layer3_out.V(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : loss_layer3_out
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : loss_layer3_out
						// regulate_c_name       : loss_layer3_out_V
						// input_type_conversion : (loss_layer3_out).range().to_string(SC_BIN).c_str()
						if (&(loss_layer3_out) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> loss_layer3_out_V_tmp_mem;
							loss_layer3_out_V_tmp_mem = (loss_layer3_out).range().to_string(SC_BIN).c_str();
							loss_layer3_out_V_tvout_wrapc_buffer[hls_map_index].range(15, 0) = loss_layer3_out_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_loss_layer3_out_V, "%s\n", (loss_layer3_out_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_loss_layer3_out_V, tvout_loss_layer3_out_V);
		}

		tcl_file.set_num(1, &tcl_file.loss_layer3_out_V_depth);
		sprintf(tvout_loss_layer3_out_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_loss_layer3_out_V, tvout_loss_layer3_out_V);

		// release memory allocation
		delete [] loss_layer3_out_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_const_size_in_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_const_size_in_1, tvout_const_size_in_1);

		sc_bv<16>* const_size_in_1_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: const_size_in_1
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: const_size_in_1(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : const_size_in_1
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : const_size_in_1
						// regulate_c_name       : const_size_in_1
						// input_type_conversion : const_size_in_1
						if (&(const_size_in_1) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> const_size_in_1_tmp_mem;
							const_size_in_1_tmp_mem = const_size_in_1;
							const_size_in_1_tvout_wrapc_buffer[hls_map_index].range(15, 0) = const_size_in_1_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_const_size_in_1, "%s\n", (const_size_in_1_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_const_size_in_1, tvout_const_size_in_1);
		}

		tcl_file.set_num(1, &tcl_file.const_size_in_1_depth);
		sprintf(tvout_const_size_in_1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_const_size_in_1, tvout_const_size_in_1);

		// release memory allocation
		delete [] const_size_in_1_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_const_size_out_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_const_size_out_1, tvout_const_size_out_1);

		sc_bv<16>* const_size_out_1_tvout_wrapc_buffer = new sc_bv<16>[1];

		// RTL Name: const_size_out_1
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: const_size_out_1(15, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : const_size_out_1
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : const_size_out_1
						// regulate_c_name       : const_size_out_1
						// input_type_conversion : const_size_out_1
						if (&(const_size_out_1) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> const_size_out_1_tmp_mem;
							const_size_out_1_tmp_mem = const_size_out_1;
							const_size_out_1_tvout_wrapc_buffer[hls_map_index].range(15, 0) = const_size_out_1_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_const_size_out_1, "%s\n", (const_size_out_1_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_const_size_out_1, tvout_const_size_out_1);
		}

		tcl_file.set_num(1, &tcl_file.const_size_out_1_depth);
		sprintf(tvout_const_size_out_1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_const_size_out_1, tvout_const_size_out_1);

		// release memory allocation
		delete [] const_size_out_1_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "fc1_input_V"
		delete [] tvin_fc1_input_V;
		// release memory allocation: "layer3_out_0_V"
		delete [] tvout_layer3_out_0_V;
		// release memory allocation: "layer3_out_1_V"
		delete [] tvout_layer3_out_1_V;
		// release memory allocation: "loss_layer3_out_V"
		delete [] tvout_loss_layer3_out_V;
		// release memory allocation: "const_size_in_1"
		delete [] tvout_const_size_in_1;
		// release memory allocation: "const_size_out_1"
		delete [] tvout_const_size_out_1;
		// release memory allocation: "layer3_out_ground_truth_V"
		delete [] tvin_layer3_out_ground_truth_V;
		// release memory allocation: "train"
		delete [] tvin_train;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

