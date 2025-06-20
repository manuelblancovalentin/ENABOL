from __future__ import print_function
import numpy as np
import h5py
import json
import math

from ..model import HLSModel

MAXMULT = 4096

class KerasFileReader(object):
    def __init__(self, config):
        self.config = config
        self.h5file = h5py.File(config['KerasH5'], mode='r')

    def __del__(self):
        if self.h5file:
            self.h5file.close()

    def _find_data(self, layer_name, var_name):
        def h5_visitor_func(name):
            if var_name in name:
                return name

        if 'model_weights' in list(self.h5file.keys()): # h5 file comes from model.save()
            layer_path = 'model_weights/{}'.format(layer_name)
        else:
            layer_path = layer_name

        data_path = self.h5file[layer_path].visit(h5_visitor_func)
        if data_path:
            return self.h5file['/{}/{}'.format(layer_path, data_path)]
        else:
            return None

    def get_weights_data(self, layer_name, var_name):
        data = self._find_data(layer_name, var_name)
        if data:
            return data[()]
        else:
            return None

    def get_weights_shape(self, layer_name, var_name):
        data = self._find_data(layer_name, var_name)
        if data is not None:
            return data.shape
        else:
            return None

class KerasModelReader(object):
    def __init__(self, keras_model):
        self.model = keras_model

    def get_weights_data(self, layer_name, var_name):
        layer = self.model.get_layer(layer_name)
        for i, w in enumerate(layer.weights):
            if var_name in w.name:
                try:
                    return w.numpy() # TF 2.x
                except:
                    return layer.get_weights()[i] # TF 1.x

        return None

    def get_weights_shape(self, layer_name, var_name):
        layer = self.model.get_layer(layer_name)
        for w in layer.weights:
            if var_name in w.name:
                return w.shape.as_list()

        return None

def get_qkeras_quantization(layer, keras_layer):
    if not layer['class_name'].startswith('Q'): # Not a QKeras layer, nothing to do
        return
    kernel_quantizer = keras_layer['config']['kernel_quantizer']['class_name']
    bias_quantizer = keras_layer['config']['bias_quantizer']['class_name']

    if kernel_quantizer != bias_quantizer:
        raise Exception('Mixing quantizers within QKeras layers is not supported')
    if kernel_quantizer == 'binary':
        layer['quantize'] = 2
    elif kernel_quantizer == 'ternary':
        layer['quantize'] = 3
    else:
        raise Exception('Unsupported quantizer {} in {} layer {}'.format(kernel_quantizer, layer['class_name'], layer['name']))


layer_handlers = {}

def register_keras_layer_handler(layer_name, handler_func):
    if layer_name in layer_handlers:
        raise Exception('Layer {} already registered'.format(layer_name))
    else:
        layer_handlers[layer_name] = handler_func

def get_supported_keras_layers():
    return list(layer_handlers.keys())

def keras_handler(*args):
    def decorator(function):
        function.handles = [arg for arg in args]
        return function
    return decorator

def parse_default_keras_layer(keras_layer, input_names):
    layer = {}

    #Extract name for finding weights and biases
    layer['name'] = keras_layer['config']['name']
    layer['class_name'] = keras_layer['class_name']
    if input_names is not None:
        layer['inputs'] = input_names

    layer['data_format'] = keras_layer['config'].get('data_format', 'channels_last')

    if 'activation' in keras_layer['config']:
        layer['activation'] = keras_layer['config']['activation']
    if 'epsilon' in keras_layer['config']:
        layer['epsilon'] = keras_layer['config']['epsilon']
    if 'use_bias' in keras_layer['config']:
        layer['use_bias'] = keras_layer['config']['use_bias']

    return layer

def parse_data_format(input_shape, data_format='channels_last'):
    # Ignore batch size
    input_shape = input_shape[1:]
    
    if data_format.lower() == 'channels_last':
        if len(input_shape) == 2: # 1D, (n_in, n_filt)
            return (input_shape[0], input_shape[1])
        elif len(input_shape) == 3: # 2D, (in_height, in_width, n_filt)
            return (input_shape[0], input_shape[1], input_shape[2])
        
    elif data_format.lower() == 'channels_first':
        if len(input_shape) == 2: # 1D, (n_filt, n_in)
            return (input_shape[1], input_shape[0])
        elif len(input_shape) == 3: # 2D, (n_filt, in_height, in_width)
            return (input_shape[1], input_shape[2], input_shape[0])
    else:
        raise Exception('Unknown data format: {}'.format(data_format))

def compute_padding_1d(pad_type, in_size, stride, filt_size):
    if pad_type.lower() == 'same':
        n_out = int(math.ceil(float(in_size) / float(stride)))
        if (in_size % stride == 0):
            pad_along_size = max(filt_size - stride, 0)
        else:
            pad_along_size = max(filt_size - (in_size % stride), 0)
        pad_left  = pad_along_size // 2
        pad_right  = pad_along_size - pad_left
    elif pad_type.lower() == 'valid':
        n_out = int(math.ceil(float(in_size - filt_size + 1) / float(stride)))
        pad_left = 0
        pad_right = 0
    else:
        raise Exception('Unknown padding type: {}'.format(pad_type))

    return (n_out, pad_left, pad_right)

def compute_padding_2d(pad_type, in_height, in_width, stride_height, stride_width, filt_height, filt_width):
    if pad_type.lower() == 'same':
        #Height
        out_height = int(math.ceil(float(in_height) / float(stride_height)))
        if (in_height % stride_height == 0):
            pad_along_height = max(filt_height - stride_height, 0)
        else:
            pad_along_height = max(filt_height - (in_height % stride_height), 0)
        pad_top = pad_along_height // 2
        pad_bottom = pad_along_height - pad_top
        #Width
        out_width = int(math.ceil(float(in_width) / float(stride_width)))
        if (in_width % stride_width == 0):
            pad_along_width = max(filt_width - stride_width, 0)
        else:
            pad_along_width = max(filt_width - (in_width % stride_width), 0)
        pad_left = pad_along_width // 2
        pad_right = pad_along_width - pad_left
    elif pad_type.lower() == 'valid':
        out_height = int(math.ceil(float(in_height - filt_height + 1) / float(stride_height)))
        out_width = int(math.ceil(float(in_width - filt_width + 1) / float(stride_width)))
        
        pad_top = 0
        pad_bottom = 0
        pad_left = 0
        pad_right = 0
    else:
        raise Exception('Unknown padding type: {}'.format(pad_type))

    return (out_height, out_width, pad_top, pad_bottom, pad_left, pad_right)

def keras_to_hls(config):

    ######################
    ##  Do translation
    ######################

    #This is a list of dictionaries to hold all the layer info we need to generate HLS
    layer_list = []

    if 'KerasModel' in config:
        # Model instance passed in config from API
        keras_model = config['KerasModel']
        if isinstance(keras_model, str):
            from tensorflow.keras.models import load_model
            keras_model = load_model(keras_model)
        model_arch = json.loads(keras_model.to_json())
        reader = KerasModelReader(keras_model)
    elif 'KerasJson' in config:
        # Extract model architecture from json
        with open(config['KerasJson']) as json_file:
            model_arch = json.load(json_file)
        reader = KerasFileReader(config)
    elif 'KerasH5' in config:
        # Model arch and weights are in H5 file (from model.save() function)
        with h5py.File(config['KerasH5'], mode='r') as h5file:
            # Load the configuration from h5 using json's decode
            model_arch = h5file.attrs.get('model_config')
            if model_arch is None:
                raise ValueError('No model found in config file.')
            else:
                model_arch = json.loads(model_arch.decode('utf-8'))
        reader = KerasFileReader(config)
    else:
        raise ValueError('No model found in config file.')

    #print(model_arch)

    #[@manuelblancovalentin]: Updated code using enabol. June/19/2025
    skip_layers = ['Dropout']
    supported_layers = get_supported_keras_layers() + skip_layers
    input_layers = None
    output_layers = None
    # Init layer config
    layer_config = None 
    if model_arch['class_name'] == 'Sequential':
        raise Exception('Sequential models are not supported yet. Please use the Functional API or Model API to define your model.')
        # print('Interpreting Sequential')
        # layer_config = model_arch['config']
        # if 'layers' in layer_config: # Newer Keras versions have 'layers' in 'config' key
        #     layer_config = layer_config['layers']
        # # Sequential doesn't have InputLayer in TF < 2.3 (Keras 2.4.0)
        # if layer_config[0]['class_name'] != 'InputLayer':
        #     input_layer = {}
        #     input_layer['name'] = 'input1'
        #     input_layer['class_name'] = 'InputLayer'
        #     input_layer['input_shape'] = layer_config[0]['config']['batch_input_shape'][1:]
        #     layer_list.append(input_layer)
        #     print('Input shape:', input_layer['input_shape'])
        #     input_layers = [input_layer['name']]
        # output_layers = layer_
    elif model_arch['class_name'] in ['Model', 'Functional']: # TF >= 2.3 calls it 'Funcational' API
        print('Interpreting Model')
        layer_config = model_arch['config']['layers']
        input_layers = [ inp[0] for inp in model_arch['config']['input_layers'] ]
        output_layers = [ out[0] for out in model_arch['config']['output_layers'] ]

        # We need to populate the layer_list
        for keras_layer in layer_config:
            # Get class 
            keras_class = keras_layer['class_name']

            # Init names and shapes (if InputLayer this can be None)
            input_shapes = None
            input_names = None

            def expand_dict_recursive(d):
                """Expand a dict recursively to handle nested dicts."""
                expanded = {}
                if isinstance(d, list):
                    # If the input is a list, expand each item
                    return [expand_dict_recursive(item) if isinstance(item, dict) else item for item in d]
                for key, value in d.items():
                    if isinstance(value, dict):
                        expanded.update(expand_dict_recursive(value))
                    elif isinstance(value, list):
                        # Loop thru the list and expand dicts
                        expanded[key] = [expand_dict_recursive(item) if isinstance(item, dict) else item for item in value]
                    elif isinstance(value, tuple):
                        # Convert tuple to list
                        expanded[key] = [expand_dict_recursive(item) if isinstance(item, dict) else item for item in value]
                    else:
                        expanded[key] = value
                return expanded
            
            if 'inbound_nodes' in keras_layer and len(keras_layer['inbound_nodes']) > 0:
                for node in keras_layer['inbound_nodes']:
                    # convert args/kwargs to dict 
                    if isinstance(node, dict):
                        if 'args' in node and 'kwargs' in node:
                            subconf = expand_dict_recursive(node['args'])
                            #subconf.update(expand_dict_recursive(node['kwargs']))
                            #node = node['args'] + [node['kwargs']]
                            if len(subconf) > 0 and not isinstance(subconf, dict):
                                subconf = subconf[0]
                            if input_names is None:
                                input_names = []
                            if 'keras_history' in subconf:
                                input_names.append(subconf['keras_history'][0])
                                if 'shape' in subconf:
                                    if input_shapes is None:
                                        input_shapes = []
                                    input_shapes.append(subconf['shape'])

            layer, output_shape = layer_handlers[keras_class](keras_layer, input_names, input_shapes, reader, config)

            # print layer info
            print('Layer name: {}, layer type: {}, input shapes: {}, output shape: {}'.format(layer['name'], layer['class_name'], input_shapes, output_shape))
            
            # Add to layer_list
            layer_list.append(layer)
            

            # In case this layer has some activation embedded on it, and in case it's not linear, we need to
            # add it too.
            if 'activation' in keras_layer['config']:
                act_class = keras_layer['config']['activation']
                if act_class in ['linear']:
                    print(f'[INFO] - Skipping activation layer {act_class} for layer {layer["name"]}')
                elif act_class in ['relu']: # 'softmax', 'sigmoid', 'tanh', 'relu', 'elu', 'selu', 'leakyrelu', 'prelu', 'thresholdedrelu'
                    act_layer = {}
                    act_layer['name'] = layer['name'] + '_' + act_class
                    act_layer['activation'] = act_class
                    if 'activ_param' in keras_layer['config']:
                        act_layer['activ_param'] = keras_layer['config']['activ_param']
                        act_layer['class_name'] = keras_layer['config']['activation']
                    elif act_class == 'softmax':
                        act_layer['class_name'] = 'Softmax'
                        act_layer['axis'] = -1
                    else:
                        act_layer['class_name'] = 'Activation'
                    #inputs_map[layer['name']] = act_layer['name']
                    if output_layers is not None and layer['name'] in output_layers:
                        output_layers = [act_layer['name'] if name == layer['name'] else name for name in output_layers]
                    layer_list.append(act_layer)
                else:
                    raise Exception('Unsupported activation function {} in layer {}'.format(act_class, layer['name']))
            
            assert(output_shape is not None)


    #################
    ## Generate HLS
    #################

    print('Creating HLS model')
    hls_model = HLSModel(config, reader, layer_list, input_layers, output_layers)
    return hls_model















    #Define layers to skip for conversion to HLS
    skip_layers = ['Dropout']
    #All supported layers
    supported_layers = get_supported_keras_layers() + skip_layers

    #Map inputs of skipped and split (activation) layers
    inputs_map = {}

    #Loop through layers
    layer_counter = 0

    input_layers = None
    output_layers = None

    layer_config = None
    if model_arch['class_name'] == 'Sequential':
        print('Interpreting Sequential')
        layer_config = model_arch['config']
        if 'layers' in layer_config: # Newer Keras versions have 'layers' in 'config' key
            layer_config = layer_config['layers']
        # Sequential doesn't have InputLayer in TF < 2.3 (Keras 2.4.0)
        if layer_config[0]['class_name'] != 'InputLayer':
            input_layer = {}
            input_layer['name'] = 'input1'
            input_layer['class_name'] = 'InputLayer'
            input_layer['input_shape'] = layer_config[0]['config']['batch_input_shape'][1:]
            layer_list.append(input_layer)
            print('Input shape:', input_layer['input_shape'])
    elif model_arch['class_name'] in ['Model', 'Functional']: # TF >= 2.3 calls it 'Funcational' API
        print('Interpreting Model')
        layer_config = model_arch['config']['layers']
        input_layers = [ inp[0] for inp in model_arch['config']['input_layers'] ]
        output_layers = [ out[0] for out in model_arch['config']['output_layers'] ]

    # Get input shape and check for unsupported layer type
    for keras_layer in layer_config:
        if keras_layer['class_name'] not in supported_layers:
            raise Exception('ERROR: Unsupported layer type: {}'.format(keras_layer['class_name']))

    output_shapes = {}
    output_shape = None

    print('Topology:')
    for keras_layer in layer_config:
        
        
        import enabol
        input_shapes = enabol.utils.get_inbound_input_shapes(keras_layer)
        
        
        
        
        # if 'batch_input_shape' in keras_layer['config']:
        #     if 'inbound_nodes' in keras_layer and len(keras_layer['inbound_nodes']) > 0:
        #         input_shapes = [output_shapes[inbound_node[0]] for inbound_node in keras_layer['inbound_nodes'][0]]
        #     else:
        #         input_shapes = [keras_layer['config']['batch_input_shape']]
        # elif 'batch_shape' in keras_layer['config']:
        #     #[@manuelblancovalentin]: Apparently keras renamed this in some later version.
        #     if 'inbound_nodes' in keras_layer and len(keras_layer['inbound_nodes']) > 0:
        #         input_shapes = [output_shapes[inbound_node[0]] for inbound_node in keras_layer['inbound_nodes'][0]]
        #     else:
        #         input_shapes = [keras_layer['config']['batch_shape']]
        # else:
        #     if 'inbound_nodes' in keras_layer:
        #         input_shapes = [output_shapes[inbound_node[0]] for inbound_node in keras_layer['inbound_nodes'][0]]
        #         #[@manuelblancovalentin]: What if inbound nodes is an empty list?
        #     else:
        #         # Sequential model, so output_shape from the previous layer is still valid 
        #         input_shapes = [output_shape]

        keras_class = keras_layer['class_name']

        if keras_class in skip_layers:
            if 'inbound_nodes' in keras_layer:
                name = keras_layer['config']['name']
                #Currently supported skipped layers have only one input
                parent_input = keras_layer['inbound_nodes'][0][0][0]
                #Skipped layers can follow each other (e.g., Dropout -> Flatten)
                inputs_map[name] = inputs_map.get(parent_input, parent_input)

            output_shapes[keras_layer['config']['name']] = input_shapes[0]

            continue

        if keras_class in supported_layers:
            layer_counter = layer_counter + 1

        #Extract inbound nodes
        if 'inbound_nodes' in keras_layer and len(keras_layer['inbound_nodes']) > 0:
            input_names = [ inputs_map.get(inp[0], inp[0]) for inp in keras_layer['inbound_nodes'][0] ]
        else:
            input_names = None

        layer, output_shape = layer_handlers[keras_class](keras_layer, input_names, input_shapes, reader, config)

        print('Layer name: {}, layer type: {}, input shapes: {}, output shape: {}'.format(layer['name'], layer['class_name'], input_shapes, output_shape))
        layer_list.append( layer )
        if 'activation' in layer and layer['class_name'] not in ['Activation', 'LeakyReLU', 'ThresholdedReLU', 'ELU', 'PReLU', 'Softmax', 'TernaryTanh']:# + qkeras_layers:
            act_layer = {}
            act_layer['name'] = layer['name'] + '_' + layer['activation']
            act_layer['activation'] = layer['activation']
            if 'activ_param' in layer:
                act_layer['activ_param'] = layer['activ_param']
                act_layer['class_name'] = layer['activation']
            elif layer['activation'] == 'softmax':
                act_layer['class_name'] = 'Softmax'
                act_layer['axis'] = -1
            else:
                act_layer['class_name'] = 'Activation'
            inputs_map[layer['name']] = act_layer['name']
            if output_layers is not None and layer['name'] in output_layers:
                output_layers = [act_layer['name'] if name == layer['name'] else name for name in output_layers]
            layer_list.append(act_layer)

        assert(output_shape is not None)
        
        output_shapes[layer['name']] = output_shape

    #################
    ## Generate HLS
    #################

    print('Creating HLS model')
    hls_model = HLSModel(config, reader, layer_list, input_layers, output_layers)
    return hls_model
