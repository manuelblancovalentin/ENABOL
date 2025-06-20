from __future__ import print_function
import tarfile
import yaml
from shutil import copyfile, copytree, rmtree
import numpy as np
import os
import re
import glob
from collections import OrderedDict

from hls4ml.writer.writers import Writer
from hls4ml.model.hls_layers import XnorPrecisionType

config_filename = 'hls4ml_config.yml'

class VivadoWriter(Writer):

    def type_definition_cpp(self, model, atype):
        type_class = atype.__class__.__name__
        if type_class == 'HLSType':
            return 'typedef {precision} {name};\n'.format(name=atype.name, precision=atype.precision)
        elif type_class == 'CompressedType':
            cpp_fmt = ('typedef struct {name} {{ '
               '{index} row_index;'
               '{index} col_index;'
               '{precision} weight; }} {name};\n')
            return cpp_fmt.format(name=atype.name, index=atype.index_precision, precision=atype.precision)
        elif type_class == 'PackedType':
            n_elem_expr = '/' if atype.unpack else '*'
            return 'typedef nnet::array<{precision}, {n_elem}> {name};\n'.format(name=atype.name, precision=atype.precision, n_elem=str(atype.n_elem) + n_elem_expr + str(atype.n_pack))
        elif type_class == 'ExponentType':
            cpp_fmt = ('typedef struct {name} {{ '
                       '{sign} sign; '
                       '{precision} weight; }} {name};\n')
            return cpp_fmt.format(name=atype.name, precision=atype.precision, sign=str(XnorPrecisionType()))
        else:
            raise Exception('Unknown data type class "{}"'.format(type_class))

    def variable_definition_cpp(self, model, var, name_suffix='', as_reference=False):
        var_class = var.__class__.__name__
        if var_class == 'ArrayVariable':
            return '{type} {name}{suffix}[{shape}]'.format(type=var.type.name, name=var.cppname, suffix=name_suffix, shape=var.size_cpp())
        elif var_class == 'StreamVariable':
            if as_reference: # Function parameter
                return 'hls::stream<{type}> &{name}{suffix}'.format(type=var.type.name, name=var.cppname, suffix=name_suffix)
            else: # Declaration
                return 'hls::stream<{type}> {name}{suffix}("{name}")'.format(type=var.type.name, name=var.cppname, suffix=name_suffix)
        elif var_class == 'WeightVariable':
            return '{type} {name}{suffix}[{size}]'.format(type=var.type.name, name=var.cppname, suffix=name_suffix, size=var.data_length)
        elif var_class == 'InplaceVariable':
            return None
        else:
            raise Exception('Unknown variable class "{}"'.format(var_class))

    def print_array_to_cpp(self, var, odir, write_txt_file=True):
        #######################################
        ## Print weight array to C++
        #######################################

        h_file = open("{}/firmware/weights/{}.h".format(odir,var.name),"w")
        if write_txt_file:
            txt_file = open("{}/firmware/weights/{}.txt".format(odir,var.name),"w")

        #meta data
        h_file.write("//Numpy array shape {}\n".format(var.shape))
        h_file.write("//Min {:.12f}\n".format(np.min(var.min)))
        h_file.write("//Max {:.12f}\n".format(np.max(var.max)))
        h_file.write("//Number of zeros {}\n".format(var.nzeros))
        h_file.write("\n")

        h_file.write("#ifndef {}_H_\n".format(var.name.upper()))
        h_file.write("#define {}_H_\n".format(var.name.upper()))
        h_file.write("\n")

        if write_txt_file:
            h_file.write("#ifndef __SYNTHESIS__\n")
            h_file.write(var.definition_cpp() + ";\n")
            h_file.write("#else\n")

        h_file.write(var.definition_cpp() + " = {")

        #fill c++ array.
        #not including internal brackets for multidimensional case
        sep = ''
        for x in var:
            h_file.write(sep + x)
            if write_txt_file:
                txt_file.write(sep + x)
            sep = ", "
        h_file.write("};\n")
        if write_txt_file:
            h_file.write("#endif\n")
            txt_file.close()
        h_file.write("\n#endif\n")
        h_file.close()

    def write_project_dir(self, model):
        if not os.path.isdir("{}/firmware/weights".format(model.config.get_output_dir())):
            os.makedirs("{}/firmware/weights".format(model.config.get_output_dir()))

    @staticmethod
    def _make_array_pragma(variable):
        """
        Layers in hls_model.py can specify output array partitioning through the `pragma` attribute.
        If `pragma` is a string: options are 'partition', 'reshape', or 'stream'.
        If `pragma` is a tuple: (mode, type, factor) where mode is 'partition' or 'reshape', type is
        'complete', 'cyclic', or 'block', and factor is an integer only used when the type is not 'complete'.
        """
        
        config = variable.pragma
        if type(config) is tuple:
            mode = config[0]
            if mode in ['partition', 'reshape']:
                typ = config[1]
                if typ != 'complete':
                    factor = config[2]
            elif mode == 'stream':
                depth = config[1]
        else:
            mode = config
            typ = 'complete'
            factor = 0

        if mode in ['partition', 'reshape']:
            if typ == 'complete':
                template = '#pragma HLS ARRAY_{mode} variable={name} {type} dim={dim}'
            else:
                template = '#pragma HLS ARRAY_{mode} variable={name} {type} factor={factor} dim={dim}'

            return template.format(mode=mode.upper(), name=variable.name, type=typ, factor=factor, dim=0)

        elif mode == 'stream':
            return '#pragma HLS STREAM variable={name} depth={depth}'.format(name=variable.name, depth=depth)

    def write_project_cpp(self, model):
        ###################
        ## myproject.cpp
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))
        f = open(os.path.join(filedir,'../templates/vivado/firmware/myproject.cpp'),'r')
        fout = open('{}/firmware/{}.cpp'.format(model.config.get_output_dir(), model.config.get_project_name()),'w')

        model_inputs = model.get_input_variables()
        model_outputs = model.get_output_variables()
        model_brams   = model.get_bram_variables()

        indent = '    '

        for line in f.readlines():
            #Add headers to weights and biases
            if 'myproject' in line:
                newline = line.replace('myproject', model.config.get_project_name())

            elif '//hls-fpga-machine-learning insert autograd-def' in line:
                # [@manuelbv]: CHANGELOG_a.6 If this is a trainable network, include autograd losses definition
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline =  "// -------------------------- AUTOGRAD --------------------------\n"
                    newline += "// [@manuelbv]: Manually including parameters for autograd\n"
                    newline += '#include "losses/losses_parameters.h"\n'
                    newline += "// --------------------------------------------------------------\n"

            elif '//hls-fpga-machine-learning insert header' in line:
                inputs_str = ', '.join([self.variable_definition_cpp(model, i, as_reference=True) for i in model_inputs])
                outputs_str = ', '.join([self.variable_definition_cpp(model, o, as_reference=True) for o in model_outputs])
                brams_str  = ', \n'.join([indent + self.variable_definition_cpp(model, b, as_reference=False) for b in model_brams])

                #[@manuelbv]: CHANGELOG_a.8 If this is a trainable network, then we need to add the loss definitions as pointers
                _autograd_loss_definition = lambda var: '{type} &loss_{name}'.format(type=var.type.name, name=var.cppname)
                loss_str = ', '.join([_autograd_loss_definition(o) for o in model_outputs])
                ground_truth_str = ', '.join([self.variable_definition_cpp(model, o, as_reference=True, name_suffix="_ground_truth") for o in model_outputs])

                insize_str = ', '.join(['unsigned short &const_size_in_{}'.format(i) for i in range(1, len(model_inputs) + 1)])
                outsize_str = ', '.join(['unsigned short &const_size_out_{}'.format(i) for i in range(1, len(model_outputs) + 1)])

                newline = ''
                newline += indent + inputs_str + ',\n'
                newline += indent + outputs_str + ',\n'
                if len(model_brams) > 0: 
                    newline += brams_str + ',\n'
                
                # [@manuelbv]: If model is trainable, add loss + ground truth IOs
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += indent + loss_str + ',\n'
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + ',\n'
                    newline += indent + ground_truth_str + ',\n'
                    newline += indent + "bool train" + '\n'
                else:
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + '\n'
                

            elif '//hls-fpga-machine-learning insert load weights' in line:
                newline = line
                for layer in model.get_layers():
                    for w in layer.get_weights():
                        if w.__class__.__name__ == 'CompressedWeightVariable':
                            newline += indent + '    nnet::load_compressed_weights_from_txt<{}, {}>({}, "{}.txt");\n'.format(w.type.name, w.nonzeros, w.name, w.name)
                        elif w.__class__.__name__ == 'ExponentWeightVariable':
                            newline += indent + '    nnet::load_exponent_weights_from_txt<{}, {}>({}, "{}.txt");\n'.format(w.type.name, w.data_length, w.name, w.name)
                        else:
                            newline += indent + '    nnet::load_weights_from_txt<{}, {}>({}, "{}.txt");\n'.format(w.type.name, w.data_length, w.name, w.name)

            #Add input/output type
            elif '//hls-fpga-machine-learning insert IO' in line:
                newline = line
                all_inputs = [i.cppname for i in model_inputs]
                all_outputs = [o.cppname for o in model_outputs]
                all_brams = [b.cppname for b in model_brams] 
                io_type = model.config.get_config_value("IOType")

                if io_type == 'io_parallel':
                    for i in model_inputs: newline += indent + self._make_array_pragma(i) + '\n'
                    for o in model_outputs: newline += indent + self._make_array_pragma(o) + '\n'
                    # TODO discussed adding a handle for setting the interface mode for individual input and output arrays (16.03.2020)
                    # Probably the handle doesn't need to be exposed to the user but should be just set in hls_model.py
                    newline += indent + '#pragma HLS INTERFACE ap_vld port={},{} \n'.format(','.join(all_inputs), ','.join(all_outputs))
                    if model.config.model_strategy.lower() == 'resource':
                        newline += indent + '#pragma HLS DATAFLOW \n'
                    else:
                        newline += indent + '#pragma HLS PIPELINE \n'
                if io_type == 'io_serial' or io_type == 'io_stream':
                    newline += indent + '#pragma HLS INTERFACE axis port={},{} \n'.format(','.join(all_inputs), ','.join(all_outputs))
                    if all_brams: # No BRAM ports
                        newline += indent + '#pragma HLS INTERFACE bram port={} \n'.format(','.join(all_brams))
                    newline += indent + '#pragma HLS DATAFLOW \n'

                inval_str = '\n    '.join(['const_size_in_{} = {};'.format(i, inp.size_cpp()) for i, inp in enumerate(model_inputs, 1)])
                outval_str = '\n    '.join(['const_size_out_{} = {};'.format(i, out.size_cpp()) for i, out in enumerate(model_outputs, 1)])
                newline += '\n' + indent + inval_str
                newline += '\n' + indent + outval_str
                newline += '\n'

            elif '//hls-fpga-machine-learning insert layers' in line:
                newline = line + '\n'
                inputs = model.get_input_variables()
                outputs = model.get_output_variables()
                for layer in model.get_layers():
                    vars = layer.get_variables()
                    for var in vars:
                        if var not in inputs and var not in outputs:
                            def_cpp = self.variable_definition_cpp(model, var)
                            if def_cpp is not None:
                                newline += '    ' + def_cpp + ';\n'
                                if var.pragma:
                                    newline += '    ' + self._make_array_pragma(var) + '\n'
                    func = layer.function_cpp()
                    if func:
                        if len(func) == 1:
                            newline += '    ' + func[0] + ' // ' + layer.name + '\n'
                        else:
                            newline += '// ' + layer.name + '\n'
                            for line in func:
                                newline += '    ' + line + '\n'
                        if model.config.trace_output and layer.get_attr('Trace', False):
                            newline += '#ifndef __SYNTHESIS__\n'
                            for var in vars:
                                newline += '    nnet::save_layer_output<{}>({}, "{}", {});\n'.format(var.type.name, var.name, layer.name, var.size_cpp())
                            newline += '#endif\n'
                        newline += '\n'

            elif '//hls-fpga-machine-learning autograd-layer-wrappers' in line:
                # [@manuelbv]: CHANGELOG_a.11 If this is a trainable network, include the definition of the autograd layer wrappers
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    
                    # [@manuelbv]: Add a comment for later change traceability 
                    newline =  '    ' + "// -------------------------------- AUTOGRAD ---------------------------------\n"
                    newline += '    ' + '// [@manuelbv]: Instantiation of grads and computation of loss for each output\n'
                    newline += '    ' + "// ---------------------------------------------------------------------------\n"

                    # [@manuelbv]: Get outputs
                    outputs = model.get_output_variables()

                    # [@manuelbv]: Get losses
                    losses = model.config.config['HLSConfig']['Model']['Losses']

                    # [@manuelbv]: Loop thru outputs
                    for no,(o,lo) in enumerate(zip(outputs,losses)):
                        grad_str = self.variable_definition_cpp(model, o, as_reference=True, name_suffix="_grads")
                        # [@manuelbv]: Add definition of grad var
                        newline += '    ' + f'// [@manuelbv]: Definition of the gradient for output {o.cppname}\n'
                        newline += '    ' + f'{grad_str};\n'
                        # [@manuelbv]: Now check if ground truth is a valid pointer (valid data), if not, loss will be zero and grad will not be applied
                        ground_truth_str = f'{o.cppname}_ground_truth'
                        newline += '    ' + f'if (train) ' + "{\n"
                        # [@manuelbv]: Add a placeholder for printing out information in case we want it
                        newline += ''.join(['    ']*2) + f'// [@manuelbv]: Uncomment this for debugging\n'
                        newline += ''.join(['    ']*2) + f'//std::cout <<  "Ground truth passed to nnet thru output {o.cppname} seems valid, computing loss" << std::endl ;\n'
                        # [@manuelbv]: Instantiation of the actual loss computation
                        if lo == "mse":
                            newline += ''.join(['    ']*2) + f'losses::mse<{o.type.name}, mse_config>({o.cppname}, {ground_truth_str}, loss_{o.cppname}, {o.cppname}_grads);\n'
                        else:
                            raise ValueError(f"Loss {lo} not implemented yet.")
                        newline += '    ' + '} else {\n'
                        newline += ''.join(['    ']*2) + f'// [@manuelbv]: Uncomment this for debugging\n'
                        newline += ''.join(['    ']*2) + f'//std::cout <<  "Ground truth passed to nnet thru output {o.cppname} is invalid (nullptr). Loss=0. Not performing backprop." << std::endl ;\n'
                        if lo == "mse":
                            newline += ''.join(['    ']*2) + f'losses::mse<{o.type.name}, mse_config>({o.cppname}, {o.cppname}, loss_{o.cppname}, {o.cppname}_grads);\n'
                        else:
                            raise ValueError(f"Loss {lo} not implemented yet.")
                        newline += '    ' + '}\n'

                        # [@manuelbv] At the end we want something like this:
                        """
                        //[@manuelbv]: Instantiate the loss and grads
                        result_t grads_layer3_out[N_LAYER_2];
                        if(layer3_ground_truth != nullptr) {
                            //std::cout <<  "Ground truth passed to nnet seems valid, computing loss" << std::endl ;
                            losses::mse<result_t, mse_config>(layer3_out,layer3_ground_truth,loss,grads_layer3_out);
                        } else {
                            //std::cout <<  "Ground truth passed to nnet is nullptr, invalid loss" << std::endl ;
                            losses::mse<result_t, mse_config>(layer3_out,layer3_out,loss,grads_layer3_out);
                        }
                        """

                        # [@manuelbv]: Now we need to add the actual backpropagation
                        inputs = model.get_input_variables()
                        outputs = model.get_output_variables()
                        grads = []
                        newline += "\n" + '    ' + "// [@manuelbv]: Backpass\n"
                        #print("----")
                        #newline = ""
                        for layer in reversed(model.get_layers()):
                            layer_type = layer.attributes['class_name']
                            layer_name = layer.attributes['name']
                            vars = layer.get_variables()
                            layer_config_cpp = layer.config_cpp()
                            layer_config = dict()
                            if layer_config_cpp:
                                layer_config_cpp = layer_config_cpp.split("struct ")[1].split(" :")[0]
                                print(layer_config_cpp)
                            if layer_type.lower() == 'activation':
                                layer_config['activation'] = layer.attributes['activation']
                            elif layer_type.lower() == 'dense' or layer_type.lower() == 'qdense':
                                layer_config['WnB'] = [layer.weights['weight'].cppname, layer.weights['bias'].cppname]
                            for var in vars:
                                grads.append([layer_name, layer_type, var.cppname, var.type.name, var.size_cpp(), layer_config_cpp, layer_config])
                                # if var not in inputs and var not in outputs:
                                #     print(var.type.name)
                                # else: 
                                #     print(f"Input/Output: {var.type.name}")
                            if len(grads) > 1:
                                # Make declaration with previous grads
                                prev_grad = grads[-2]
                                prev_grad_layer_type = prev_grad[1]
                                prev_grad_outvar_name = prev_grad[2]
                                prev_grad_outvar_type = prev_grad[3]
                                prev_grad_config = prev_grad[5]
                                prev_grad_layer_config = prev_grad[6]
                                this_grad_name = f"{var.cppname}_grads"
                                this_grad_size = var.size_cpp()
                                this_grad_type = var.type.name
                                this_grad_def = f"{this_grad_type} {this_grad_name}[{this_grad_size}];"
                                #print(this_grad_def)
                                newline += '    ' + this_grad_def + '\n'
                                if prev_grad_layer_type.lower() == 'activation':
                                    if prev_grad_layer_config['activation'] == 'linear':
                                        backpass_def = 'linear_backpass'
                                    else:
                                        raise ValueError(f"Activation {prev_grad_layer_config['activation']} not implemented yet")
                                    backpass = f"nnet::{backpass_def}<{prev_grad_outvar_type}, {this_grad_type}, {prev_grad_config}>({prev_grad_outvar_name}_grads, {this_grad_name}); // {prev_grad[0]}"
                                elif prev_grad_layer_type.lower() == 'dense' or prev_grad_layer_type.lower() == 'qdense':
                                    print(prev_grad_layer_config)
                                    WnB = prev_grad_layer_config['WnB']
                                    backpass = f"nnet::dense_backpass<{prev_grad_outvar_type}, {this_grad_type}, {prev_grad_config}>({prev_grad_outvar_name}_grads, {this_grad_name}, {var.cppname}, {', '.join(WnB)}); // {prev_grad[0]}"
                                else:
                                    raise ValueError(f"Unknown type of layer {prev_grad_layer_type.lower()}")
                                newline += '    ' + backpass + '\n\n'
                            # print(prev_grad, layer_type,layer_name)
                            #print("----")

                        newline += "\n\n"
                        #print(newline)

                        """
                        // [@manuelbv]: Backpass
                        // see: https://mattmazur.com/2015/03/17/a-step-by-step-backpropagation-example/

                        // linear
                        result_t grads_layer2_out[N_LAYER_2];
                        nnet::linear_backpass<result_t, linear_config3>(grads_layer3_out, grads_layer2_out); // fc1_linear

                        // fc1 
                        result_t grads_fc1_out[N_LAYER_2];
                        nnet::dense_backpass<input_t, result_t, config2>(grads_layer2_out, grads_fc1_out, fc1_input, w2, b2); // fc1

                        """

            #Just copy line
            else:
                newline = line

            fout.write(newline)

        f.close()
        fout.close()

    def write_project_header(self, model):
        #######################
        ## myproject.h
        #######################

        filedir = os.path.dirname(os.path.abspath(__file__))
        f = open(os.path.join(filedir,'../templates/vivado/firmware/myproject.h'),'r')
        fout = open('{}/firmware/{}.h'.format(model.config.get_output_dir(), model.config.get_project_name()),'w')

        model_inputs = model.get_input_variables()
        model_outputs = model.get_output_variables()
        model_brams   = model.get_bram_variables()

        indent = '    '

        for line in f.readlines():

            if 'MYPROJECT' in line:
                newline = line.replace('MYPROJECT',format(model.config.get_project_name().upper()))
            elif 'void myproject(' in line:
                newline = 'void {}(\n'.format(model.config.get_project_name())

            elif '//hls-fpga-machine-learning insert autograd-headers' in line:
                #[@manuelbv]: CHANGELOG_a.16 If we find the "//hls-fpga-machine-learning insert autograd-headers" comment, and this is a trainable network
                #               then include the autograd headers.
                newline = ''
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline =  '// -------------------------- AUTOGRAD --------------------------\n'
                    newline += '// [@manuelbv]: Manually including definitions for autograd\n'
                    newline += '#include "autograd/autograd_defines.h"\n\n'
                    # [@manuelbv]: Parse the different types of losses used
                    losses = model.config.config['HLSConfig']['Model']['Losses']
                    losses = list(np.unique(losses))
                    if len(losses) > 0:
                        newline += '// [@manuelbv]: Manually importing losses\n'
                        for l in losses:
                            if l == 'mse':
                                newline += '#include "losses/mse.h"\n'
                            else:
                                raise ValueError(f"Unknown loss {l}")
                        newline += "\n"
                    
                    # [@manuelbv]: Import backprop implementations for diff layer types
                    newline += "// [@manuelbv]: Import backprop implementations\n"

                    # Get unique layer types
                    unique_layer_types = set([layer.attributes['class_name'] for layer in model.get_layers()])
                    # Make sure to Pop "InputLayer" and "OutputLayer"
                    unique_layer_types.discard('InputLayer')
                    unique_layer_types.discard('OutputLayer')

                    # [@manuelbv]: Loop thru unique layer types and add the corresponding backprop header
                    for ut in unique_layer_types:
                        if "dense" in ut.lower():
                            newline += '#include "autograd/nnet_dense_backprop.h"\n'
                        elif "activation" in ut.lower() or "relu" in ut.lower(): # [@manuelblancovalentin]: Expand this later
                            newline += '#include "autograd/nnet_activation_backprop.h"\n'
                        else:
                            raise ValueError(f"Unknown type of layer {ut}")
                    
                    # [@manuelbv]: Finally, close 
                    newline += "// --------------------------------------------------------------\n"
                        

                """
                // -------------------------- AUTOGRAD --------------------------
                // [@manuelbv]: Manually including definitions for autograd
                #include "autograd/autograd_defines.h"

                // [@manuelbv]: Manually importing losses
                #include "losses/mse.h"

                // [@manuelbv]: Import backprop implementations
                #include "autograd/nnet_activation_backprop.h"
                #include "autograd/nnet_dense_backprop.h"
                // --------------------------------------------------------------

                """

            elif '//hls-fpga-machine-learning insert header' in line:
                inputs_str = ', '.join([self.variable_definition_cpp(model, i, as_reference=True) for i in model_inputs])
                outputs_str = ', '.join([self.variable_definition_cpp(model, o, as_reference=True) for o in model_outputs])
                brams_str  = ', \n'.join([indent + self.variable_definition_cpp(model, b, as_reference=False) for b in model_brams])
                
                #[@manuelbv]: CHANGELOG_a.17 If this is a trainable network, then add loss + ground truth IOs in header
                _autograd_loss_definition = lambda var: '{type} &loss_{name}'.format(type=var.type.name, name=var.cppname)
                loss_str = ', '.join([_autograd_loss_definition(o) for o in model_outputs])
                ground_truth_str = ', '.join([self.variable_definition_cpp(model, o, as_reference=True, name_suffix="_ground_truth") for o in model_outputs])
                
                insize_str = ', '.join(['unsigned short &const_size_in_{}'.format(i) for i in range(1, len(model_inputs) + 1)])
                outsize_str = ', '.join(['unsigned short &const_size_out_{}'.format(o) for o in range(1, len(model_outputs) + 1)])

                newline = ''
                newline += indent + inputs_str + ',\n'
                newline += indent + outputs_str + ',\n'
                if len(model_brams) > 0: 
                    newline += brams_str + ',\n'
                
                # [@manuelbv]: If model is trainable, add loss + ground truth IOs
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += indent + loss_str + ',\n'
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + ',\n'
                    newline += indent + ground_truth_str + ',\n'
                    newline += indent + "bool train" + ' = false\n'
                else:
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + '\n'
                
            else:
                newline = line
            fout.write(newline)

        f.close()
        fout.close()

    def write_defines(self, model):
        filedir = os.path.dirname(os.path.abspath(__file__))
        f = open(os.path.join(filedir,'../templates/vivado/firmware/defines.h'),'r')
        fout = open('{}/firmware/defines.h'.format(model.config.get_output_dir()),'w')

        for line in f.readlines():

            #Insert numbers
            if '//hls-fpga-machine-learning insert numbers' in line:
                newline = line
                numbers = OrderedDict.fromkeys([layer.get_numbers_cpp() for layer in model.get_layers()])
                newline += ''.join(numbers)

            elif '//hls-fpga-machine-learning insert layer-precision' in line:
                newline = line
                all_precision = OrderedDict()
                for layer in model.get_layers():
                    layer_precision = layer.get_layer_precision()
                    all_precision.update(layer_precision)
                for used_type in all_precision.values():
                    newline += self.type_definition_cpp(model, used_type)
            else:
                newline = line
            fout.write(newline)
        f.close()
        fout.close()

    def write_parameters(self, model):
        filedir = os.path.dirname(os.path.abspath(__file__))
        f = open(os.path.join(filedir,'../templates/vivado/firmware/parameters.h'),'r')
        fout = open('{}/firmware/parameters.h'.format(model.config.get_output_dir()),'w')

        for line in f.readlines():

            if '//hls-fpga-machine-learning insert includes' in line:
                newline = line
                for include in sorted(set(sum((layer.include_list for layer in model.get_layers()), []))):
                    newline += '#include "%s"\n' % include

            elif '//hls-fpga-machine-learning insert weights' in line:
                newline = line
                for layer in model.get_layers():
                    for w in layer.get_weights():
                        if w.name not in model.bram_vars.keys():
                            newline += '#include "weights/{}.h"\n'.format(w.name)
                        else:
                            newline += '// #include "weights/{}.h"\n'.format(w.name)

            elif "//hls-fpga-machine-learning insert layer-config" in line:
                newline = line
                for layer in model.get_layers():
                    config = layer.config_cpp()
                    if config:
                        newline += '// ' + layer.name + '\n'
                        newline += config + '\n'
            else:
                newline = line
            fout.write(newline)
        f.close()
        fout.close()

    def write_weights(self, model):
        for layer in model.get_layers():
            for weights in layer.get_weights():
                self.print_array_to_cpp(weights, model.config.get_output_dir())
    
    def __make_dat_file(self, original_path, project_path): 
        """
        Convert other input/output data types into a dat file, which is
        a text file with the falttened matrix printed out. Note that ' ' is
        assumed to be the delimiter. 
        """

        #Take in data from current supported data files
        if original_path[-3:] == "npy":
            data = np.load(original_path)
        else:
            raise Exception("Unsupported input/output data files.")

        #Faltten data, just keep first dimension
        data = data.reshape(data.shape[0], -1)

        def print_data(f):
            for i in range(data.shape[0]):
                for j in range(data.shape[1]):
                    f.write(str(data[i][j]) + " ")
                f.write("\n")

        #Print out in dat file
        with open(project_path, "w" ) as f:
            print_data(f)

    def write_test_bench(self, model):
        ###################
        ## test bench
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))

        if not os.path.exists('{}/tb_data/'.format(model.config.get_output_dir())):
            os.mkdir('{}/tb_data/'.format(model.config.get_output_dir()))
        
        input_data = model.config.get_config_value('InputData')
        output_predictions = model.config.get_config_value('OutputPredictions')
        
        if input_data:
            if input_data[-3:] == "dat":
                copyfile(input_data, '{}/tb_data/tb_input_features.dat'.format(model.config.get_output_dir()))
            else:
                self.__make_dat_file(input_data,'{}/tb_data/tb_input_features.dat'.format(model.config.get_output_dir()))
        
        if output_predictions:
            if output_predictions[-3:] == "dat":
                copyfile(output_predictions, '{}/tb_data/tb_output_predictions.dat'.format(model.config.get_output_dir()))
            else:
                self.__make_dat_file(output_predictions,'{}/tb_data/tb_output_predictions.dat'.format(model.config.get_output_dir()))

        f = open(os.path.join(filedir,'../templates/vivado/myproject_test.cpp'),'r')
        fout = open('{}/{}_test.cpp'.format(model.config.get_output_dir(), model.config.get_project_name()),'w')

        for line in f.readlines():
            indent = ' ' * (len(line) - len(line.lstrip(' ')))

            #Insert numbers
            if 'myproject' in line:
                newline = line.replace('myproject', model.config.get_project_name())
            elif '//hls-fpga-machine-learning insert bram' in line:
                newline = line
                for bram in model.get_bram_variables():
                    newline += '#include \"firmware/weights/{}.h\"\n'.format(bram.cppname)
                # [@manuelbv]: We added the following extra check to add the helpers for backprop
            elif '//hls-fpga-machine-learning insert autograd-helpers-include' in line:
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline = line
                    newline += '#include "firmware/autograd/trainer_helpers.h"\n'
                # [@manuelbv]: We added the following extra check to create the file with the losses in the testbench
            elif '//hls-fpga-machine-learning insert autograd-output-file-declaration' in line:
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline = line
                    newline += indent + "// Create losses file\n"
                    newline += indent + 'std::string LOSSES_LOG = "tb_data/losses.log";\n'
                    newline += indent + 'std::ofstream flosses(LOSSES_LOG);\n\n'

                    newline += indent + "// Print header of losses file\n"
                    losses = []
                    for out in model.get_output_variables():
                        losses.append(f'"loss_{out.name}"')
                    losses = ' << ", " << '.join(losses)
                    newline += indent + f'flosses << {losses} << ' + '"\\n"' + ';\n'

                    newline += indent + '// [@manuelbv]: Definition of epoch\n'
                    newline += indent + 'int epoch = 0;\n\n'

                    newline += indent + '// [@manuelbv]: Definition of train variable (to apply backprop or not)\n'
                    newline += indent + 'bool train = (fin.is_open() && fpr.is_open());\n\n'

                    newline += indent + '// [@manuelbv]: Print header for table\n'
                    newline += indent + 'autograd::print_trainer_table_header();\n\n'

                # [@manuelbv]: Close losses file if trainable
            elif '//hls-fpga-machine-learning insert autograd-output-file-closure' in line:
                newline = line
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += indent + f'flosses.close();\n'

                #[@manuelbv]: Change the printing to custom table printing if e == 0
            elif 'if (e % CHECKPOINT == 0) std::cout << "Processing input " << e << std::endl;' in line:
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline = "//" + line
                    newline += '      ' + 'if (e % CHECKPOINT == 0) {\n'
                    newline += '      ' + '      ' + '// [@manuelbv]: Print input (sample) number\n'
                    newline += '      ' + '      ' + 'printf("| %.10d |", e);\n'
                    newline += '      ' + '      ' + 'printf(" %.10d |", epoch);\n'
                    newline += '      ' + '      ' + 'printf(" %.10u |", BATCH_SIZE);\n'
                    newline += '      ' + '      ' + '//std::cout << "Processing input " << e << std::endl;\n'
                    newline += '      ' + '}\n'
                else:
                    newline = line

            elif '//hls-fpga-machine-learning insert data' in line:
                newline = line
                offset = 0
                # for bram in model.get_bram_variables():
                #     newline += bram.definition_cpp()+';\n'
                for inp in model.get_input_variables():
                    newline += '      ' + self.variable_definition_cpp(model, inp) + ';\n'
                    newline += '      nnet::copy_data<float, {}, {}, {}>(in, {});\n'.format(inp.type.name, offset, inp.size_cpp(), inp.cppname)
                    offset += inp.size()
                for out in model.get_output_variables():
                    newline += '      ' + self.variable_definition_cpp(model, out) + ';\n'

                # [@manuelbv]: Define losses and ground truth
            elif '//hls-fpga-machine-learning insert-autograd-defs1' in line or '//hls-fpga-machine-learning insert-autograd-defs2' in line:
                # [@manuelbv]: if this network is trainable, add definition of loss and cast predictions to result
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += '\n'
                    newline += indent + '// [@manuelbv]: Definition of loss\n'
                    for out in model.get_output_variables():
                        newline += indent + f'{out.type.name} loss_{out.name};\n'

                    # Do the same for ground truth
                    for out in model.get_output_variables():
                        newline += indent + f'{out.type.name} ground_truth_{out.name}[{out.size_cpp()}];\n\n'

                        if '//hls-fpga-machine-learning insert-autograd-defs1' in line:
                            # Cast predictions into {out.type.name}
                            newline += indent + f'for (int i = 0; i < {out.size_cpp()}; i++) ' + '{\n'
                            newline += indent + indent + f'ground_truth_{out.name}[i] = static_cast<{out.type.name}>(pr[i]);\n'
                            newline += indent + '}\n'


            elif '//hls-fpga-machine-learning insert zero' in line:
                newline = line
                for inp in model.get_input_variables():
                    newline += '    ' + self.variable_definition_cpp(model, inp) + ';\n'
                    newline += '    nnet::fill_zero<{}, {}>({});\n'.format(inp.type.name, inp.size_cpp(), inp.cppname)
                for out in model.get_output_variables():
                    newline += '    ' + self.variable_definition_cpp(model, out) + ';\n'
            
            elif '//hls-fpga-machine-learning insert top-level-function' in line:
                newline = line

                size_str = indent + 'unsigned short {},{};\n'
                input_size_vars = ','.join(['size_in{}'.format(i) for i in range(1, len(model.get_input_variables()) + 1)])
                output_size_vars = ','.join(['size_out{}'.format(o) for o in range(1, len(model.get_output_variables()) + 1)])
                newline += size_str.format(input_size_vars, output_size_vars)

                input_vars = ','.join([i.cppname for i in model.get_input_variables()])
                output_vars = ','.join([o.cppname for o in model.get_output_variables()])
                bram_vars   =','.join([b.cppname for b in model.get_bram_variables()]) 

                # Concatenate the input, output, and bram variables. Filter out empty/null values
                all_vars = ','.join(filter(None, [input_vars, output_vars, bram_vars]))

                output_gt = ''
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    for out in model.get_output_variables():
                        all_vars += f', loss_{out.name}'
                        output_gt += f', ground_truth_{out.name}, train'

                top_level = indent + '{}({},{},{}{});\n'.format(model.config.get_project_name(), all_vars, input_size_vars, output_size_vars,output_gt)

                newline += top_level


                # [@manuelbv]: Add writing of loss to loss file if needed
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    losses = []
                    for out in model.get_output_variables():
                        losses.append(f'loss_{out.name}')
                    losses = ' << ", " << '.join(losses)
                    newline += indent + f'flosses << {losses} << "\\n";\n'

                # [@manuelbv]: Comment this line if this is a trainable network
            elif 'std::cout << "Predictions" << std::endl;' in line or 'std::cout << "Quantized predictions" << std::endl;' in line:
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline = '//' + line
                else:
                    newline = line

                # [@manuelbv]: Custom printing of table for autograd models
            elif '//hls-fpga-machine-learning insert autograd_custom_printing' in line:
                newline = line 
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += indent + "// Loss\n"
                    newline += indent + '//std::cout << "Loss: " << loss << std::endl;\n'
                    for out in model.get_output_variables():
                        loss_name = f'loss_{out.name}'
                        newline += indent + f'printf(" %.10s |", {loss_name}.to_string(10, true).c_str());\n'
                    newline += indent + '\n'

                    newline += indent + "// [@manuelbv]: Custom printing\n"
                    for inp in model.get_input_variables():
                        newline += indent + f"if ( {inp.size_cpp()} > 0 ) " + "{\n"
                        newline += indent + '  ' + "//input\n"
                        newline += indent + '  ' + f'printf(" %.10s |", {inp.name}[0].to_string(10, true).c_str());\n' 
                        newline += indent + "}\n"
                    newline += "\n"

                    for out in model.get_output_variables():
                        newline += indent + f"if ( {out.size_cpp()} > 0 ) " + "{\n"
                        newline += indent + '  ' + "//Prediction\n"
                        newline += indent + '  ' + f'printf(" %.10s |", {out.name}[0].to_string(10, true).c_str());\n' 
                        newline += indent + '  ' + "\n"

                        newline += indent + '  ' + "//Ground truth\n"
                        newline += indent + '  ' + f'printf(" %.8f |", pr[0]);\n' 
                        newline += indent + '  ' + "\n"

                        newline += indent + "}\n\n"

                        newline += indent + "std::cout << std::endl;\n"

            elif '//hls-fpga-machine-learning insert predictions' in line:
                # [@manuelbv]: If trainable, we will still print all this out, but as comments
                prefix = "//" if model.config.config['HLSConfig']['Model']['Trainable'] else ""

                newline = line
                for out in model.get_output_variables():
                    newline += indent + prefix + 'for(int i = 0; i < {}; i++) {{\n'.format(out.size_cpp())
                    newline += indent + prefix + '  std::cout << pr[i] << " ";\n'
                    newline += indent + prefix + '}\n'
                    newline += indent + prefix + 'std::cout << std::endl;\n'
            elif '//hls-fpga-machine-learning insert tb-output' in line:
                newline = line
                for out in model.get_output_variables():
                    newline += indent + 'nnet::print_result<{}, {}>({}, fout);\n'.format(out.type.name, out.size_cpp(), out.cppname) #TODO enable this
            elif '//hls-fpga-machine-learning insert output' in line or '//hls-fpga-machine-learning insert quantized' in line:
                # [@manuelbv]: If trainable, we will still print all this out, but as comments
                prefix = "//" if model.config.config['HLSConfig']['Model']['Trainable'] else ""

                newline = line
                for out in model.get_output_variables():
                    newline += indent + prefix + 'nnet::print_result<{}, {}>({}, std::cout, true);\n'.format(out.type.name, out.size_cpp(), out.cppname)
            else:
                newline = line
            fout.write(newline)
        f.close()
        fout.close()

    def write_bridge(self, model):
        ###################
        # c++-python bridge
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))
        f = open(os.path.join(filedir,'../templates/vivado/myproject_bridge.cpp'),'r')
        fout = open('{}/{}_bridge.cpp'.format(model.config.get_output_dir(), model.config.get_project_name()),'w')

        model_inputs = model.get_input_variables()
        model_outputs = model.get_output_variables()
        model_brams   = model.get_bram_variables()

        indent = '    '

        for line in f.readlines():

            if 'MYPROJECT' in line:
                newline = line.replace('MYPROJECT', format(model.config.get_project_name().upper()))
            elif 'myproject' in line:
                newline = line.replace('myproject', format(model.config.get_project_name()))
            elif '//hls-fpga-machine-learning insert bram' in line:
                newline = line
                for bram in model_brams:
                    newline += '#include \"firmware/weights/{}.h\"\n'.format(bram.cppname)
            elif '//hls-fpga-machine-learning insert header' in line:
                dtype = line.split('#', 1)[1].strip()
                inputs_str = ', '.join(['{type} {name}[{shape}]'.format(type=dtype, name=i.cppname, shape=i.size_cpp()) for i in model_inputs])
                outputs_str = ', '.join(['{type} {name}[{shape}]'.format(type=dtype, name=o.cppname, shape=o.size_cpp()) for o in model_outputs])
                
                #[@manuelbv]: CHANGELOG_a.18 If this is a trainable network, then add loss + ground truth IOs in header
                _autograd_loss_definition = lambda var: '{type} &loss_{name}'.format(type=dtype, name=var.cppname)
                loss_str = ', '.join([_autograd_loss_definition(o) for o in model_outputs])
                ground_truth_str = ', '.join([f'{dtype} {o.cppname}_ground_truth[{o.size_cpp()}]' for o in model_outputs])
                
                insize_str = ', '.join(['unsigned short &const_size_in_{}'.format(i) for i in range(1, len(model_inputs) + 1)])
                outsize_str = ', '.join(['unsigned short &const_size_out_{}'.format(o) for o in range(1, len(model_outputs) + 1)])

                newline = ''
                newline += indent + inputs_str + ',\n'
                newline += indent + outputs_str + ',\n'

                # [@manuelbv]: If model is trainable, add loss + ground truth IOs
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    newline += indent + loss_str + ',\n'
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + ',\n'
                    newline += indent + ground_truth_str + '\n'
                else:
                    newline += indent + insize_str + ',\n'
                    newline += indent + outsize_str + '\n'

            elif '//hls-fpga-machine-learning insert wrapper' in line:
                dtype = line.split('#', 1)[1].strip()
                newline = ''
                for i in model_inputs:
                    newline += indent + '{var};\n'.format(var=self.variable_definition_cpp(model, i, name_suffix='_ap'))
                    newline += indent + 'nnet::convert_data<{}, {}, {}>({}, {}_ap);\n'.format(dtype, i.type.name, i.size_cpp(), i.cppname, i.cppname)
                newline += '\n'
                
                for o in model_outputs:
                    newline += indent + '{var};\n'.format(var=self.variable_definition_cpp(model, o, name_suffix='_ap'))
                    if model.config.config['HLSConfig']['Model']['Trainable']:
                        newline += indent + '{type} loss_{name}_{name_suffix};\n'.format(type=o.type.name, name=o.cppname, name_suffix="ap")
                        newline += indent + '{type} {name}_ground_truth_{name_suffix}[{thisshape}];\n'.format(type=o.type.name, name=o.cppname, name_suffix="ap", thisshape=o.size_cpp())
                newline += '\n'

                input_size_vars = ','.join(['const_size_in_{}'.format(i) for i in range(1, len(model.get_input_variables()) + 1)])
                output_size_vars = ','.join(['const_size_out_{}'.format(o) for o in range(1, len(model.get_output_variables()) + 1)])
                input_vars = ','.join([i.cppname + '_ap' for i in model.get_input_variables()])
                bram_vars   =','.join([b.cppname for b in model.get_bram_variables()]) 
                output_vars = ','.join([o.cppname + '_ap' for o in model.get_output_variables()])
                
                # Concatenate the input, output, and bram variables. Filter out empty/null values
                all_vars = ','.join(filter(None, [input_vars, output_vars, bram_vars]))

                #[@manuelbv]: CHANGELOG_a.19 If this is a trainable network, then add loss + ground truth IOs in instantiation of top module
                _autograd_loss_definition = lambda var: 'loss_{name}_{name_suffix}'.format(name=var.cppname, name_suffix="ap")
                loss_str = ', '.join([_autograd_loss_definition(o) for o in model_outputs])
                ground_truth_str = ', '.join([f'{o.cppname}_ground_truth_ap' for o in model_outputs])
                
                if model.config.config['HLSConfig']['Model']['Trainable']:
                    top_level = indent + '{}({},{},{},{},{});\n'.format(model.config.get_project_name(), all_vars, loss_str, input_size_vars, output_size_vars, ground_truth_str)
                else:
                    top_level = indent + '{}({},{},{});\n'.format(model.config.get_project_name(), all_vars, input_size_vars, output_size_vars)
                newline += top_level

                newline += '\n'

                for o in model_outputs:
                    newline += indent + 'nnet::convert_data<{}, {}, {}>({}_ap, {});\n'.format(o.type.name, dtype, o.size_cpp(), o.cppname, o.cppname)
                    if model.config.config['HLSConfig']['Model']['Trainable']:
                        newline += indent + 'nnet::convert_data<{}, {}, {}>({}_ground_truth_ap, {}_ground_truth);\n'.format(o.type.name, dtype, o.size_cpp(), o.cppname, o.cppname)
                        newline += indent + 'nnet::convert_data<{}, {}, 1>(&loss_{}_ap, &loss_{});\n'.format(o.type.name, dtype, o.cppname, o.cppname)
            
            elif '//hls-fpga-machine-learning insert trace_outputs' in line:
                newline = ''
                for layer in model.get_layers():
                    if layer.function_cpp() and model.config.trace_output and layer.get_attr('Trace', False):
                            vars = layer.get_variables()
                            for var in vars:
                                newline += indent + 'nnet::trace_outputs->insert(std::pair<std::string, void *>("{}", (void *) malloc({} * element_size)));\n'.format(layer.name, var.size_cpp())
                    
            else:
                newline = line
            fout.write(newline)

        f.close()
        fout.close()

    def write_build_script(self, model):
        ###################
        # build_prj.tcl
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))

        f = open(os.path.join(filedir,'../templates/vivado/build_prj.tcl'),'r')
        fout = open('{}/build_prj.tcl'.format(model.config.get_output_dir()),'w')

        for line in f.readlines():

            line = line.replace('myproject',model.config.get_project_name())

            if 'set_part {xcku115-flvb2104-2-i}' in line:
                line = 'set_part {{{}}}\n'.format(model.config.get_config_value('XilinxPart'))
            elif 'create_clock -period 5 -name default' in line:
                line = 'create_clock -period {} -name default\n'.format(model.config.get_config_value('ClockPeriod'))

            fout.write(line)
        f.close()
        fout.close()


        ###################
        # vivado_synth.tcl
        ###################

        f = open(os.path.join(filedir,'../templates/vivado/vivado_synth.tcl'),'r')
        fout = open('{}/vivado_synth.tcl'.format(model.config.get_output_dir()),'w')
        for line in f.readlines():
            line = line.replace('myproject', model.config.get_project_name())
            if '-part' in line:
                line = 'synth_design -top {} -part {}\n'.format(model.config.get_project_name(), model.config.get_config_value('XilinxPart'))

            fout.write(line)
        f.close()
        fout.close()

        ###################
        # build_lib.sh
        ###################

        f = open(os.path.join(filedir,'../templates/vivado/build_lib.sh'),'r')
        fout = open('{}/build_lib.sh'.format(model.config.get_output_dir()),'w')

        for line in f.readlines():
            line = line.replace('myproject', model.config.get_project_name())
            line = line.replace('mystamp', model.config.get_config_value('Stamp'))
            # [@manuelbv]: CHANGELOG_a.12 -> Make sure we add all dependencies to the output build script, if trainable
            if model.config.config['HLSConfig']['Model']['Trainable']:
                line = line.replace('INCFLAGS="-Ifirmware/ap_types/"', 'INCFLAGS="-Ifirmware/ap_types -Ifirmware/autograd  -Ifirmware/losses/"')

            fout.write(line)
        f.close()
        fout.close()

    def write_nnet_utils(self, model):
        ###################
        ## nnet_utils
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))

        srcpath = os.path.join(filedir,'../templates/vivado/nnet_utils/')
        dstpath = '{}/firmware/nnet_utils/'.format(model.config.get_output_dir())

        if not os.path.exists(dstpath):
            os.mkdir(dstpath)

        headers = [os.path.basename(h) for h in glob.glob(srcpath + '*.h')]

        for h in headers:
            copyfile(srcpath + h, dstpath + h)

        ###################
        ## ap_types
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))

        srcpath = os.path.join(filedir,'../templates/vivado/ap_types/')
        dstpath = '{}/firmware/ap_types/'.format(model.config.get_output_dir())

        if os.path.exists(dstpath):
            rmtree(dstpath)

        copytree(srcpath, dstpath)


    # [@manuelbv]: CHANGELOG_a.13 - > Adding the autograd dependencies to the output folder
    def write_autograd_utils(self, model):
        ###################
        ## autograd utilities
        ###################

        filedir = os.path.dirname(os.path.abspath(__file__))
        
        if model.config.config['HLSConfig']['Model']['Trainable']:
            for ffdep in ["autograd","losses"]:
                srcpath = os.path.join(filedir,f'../templates/vivado/{ffdep}/')
                dstpath = f'{model.config.get_output_dir()}/firmware/{ffdep}/'

                if os.path.exists(dstpath):
                    rmtree(dstpath)

                copytree(srcpath, dstpath)


    def write_yml(self, model):
        ###################
        # YAML config file
        ###################

        def keras_model_representer(dumper, keras_model):
            model_path = model.config.get_output_dir() + '/keras_model.h5'
            keras_model.save(model_path)
            return dumper.represent_scalar(u'!keras_model', model_path)

        try:
            from tensorflow.keras import Model as KerasModel
            yaml.add_multi_representer(KerasModel, keras_model_representer)
        except:
            pass

        with open(model.config.get_output_dir() + '/' + config_filename, 'w') as file:
            yaml.dump(model.config.config, file)

    def write_tar(self, model):
        ###################
        # Tarball output
        ###################

        with tarfile.open(model.config.get_output_dir() + '.tar.gz', mode='w:gz') as archive:
            archive.add(model.config.get_output_dir(), recursive=True)

    def write_hls(self, model):
        print('Writing HLS project')
        self.write_project_dir(model)
        self.write_project_cpp(model)
        self.write_project_header(model)
        self.write_weights(model)
        self.write_defines(model)
        self.write_parameters(model)
        self.write_test_bench(model)
        self.write_bridge(model)
        self.write_build_script(model)
        self.write_nnet_utils(model)
        #[@manuelbv]: CHANGELOG_a.14: Added newly defined method to copy autograd/losses definitions to output dir
        self.write_autograd_utils(model)
        self.write_yml(model)
        self.write_tar(model)
        print('Done')
