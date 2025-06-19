from tensorflow.keras.utils import to_categorical
from sklearn.datasets import fetch_openml
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
import numpy as np
import matplotlib.pyplot as plt

seed = 0
np.random.seed(seed)
import tensorflow as tf
tf.random.set_seed(seed)
import os
os.environ['PATH'] = '/fpga/cad/xilinx/Vivado/2019.2/bin:' + os.environ['PATH']
os.environ['LIBRARY_PATH'] = '/usr/lib/x86_64-linux-gnu:/usr/lib32:'

ds_name = "dummy_linear_2w"
ds_dir = f"datasets/{ds_name}"

load = lambda x: np.load(os.path.join(ds_dir,x))
X_train_val = load('X_train_val.npy')
X_test = load('X_test.npy')
y_train_val = load('y_train_val.npy')
y_test = load('y_test.npy')
#classes = np.load('classes.npy', allow_pickle=True)

from tensorflow.keras.models import Sequential
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.regularizers import l1
from callbacks import all_callbacks
from tensorflow.keras.layers import Activation
from qkeras.qlayers import QDense, QActivation
from qkeras.quantizers import quantized_bits, quantized_relu

model = Sequential()
model.add(QDense(2, input_shape=(1,), 
                name='fc1',
                kernel_quantizer=quantized_bits(6,0,alpha=1), 
                bias_quantizer=quantized_bits(6,0,alpha=1),
                kernel_initializer='lecun_uniform', 
                kernel_regularizer=l1(0.0001),
                use_bias = False))
# model.add(QActivation(activation=quantized_relu(6), name='relu1'))
# model.add(QDense(32, name='fc2',
#                  kernel_quantizer=quantized_bits(6,0,alpha=1), bias_quantizer=quantized_bits(6,0,alpha=1),
#                  kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
# model.add(QActivation(activation=quantized_relu(6), name='relu2'))
# model.add(QDense(32, name='fc3',
#                  kernel_quantizer=quantized_bits(6,0,alpha=1), bias_quantizer=quantized_bits(6,0,alpha=1),
#                  kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
# model.add(QActivation(activation=quantized_relu(6), name='relu3'))
# model.add(QDense(5, name='output',
#                  kernel_quantizer=quantized_bits(6,0,alpha=1), bias_quantizer=quantized_bits(6,0,alpha=1),
#                  kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
#model.add(Activation(activation='softmax', name='softmax'))

from tensorflow_model_optimization.python.core.sparsity.keras import prune, pruning_callbacks, pruning_schedule
from tensorflow_model_optimization.sparsity.keras import strip_pruning
pruning_params = {"pruning_schedule" : pruning_schedule.ConstantSparsity(0.75, begin_step=2000, frequency=100)}
model = prune.prune_low_magnitude(model, **pruning_params)

train = True
model_name = f"model_{ds_name}"
if train:
    adam = Adam(lr=0.1)
    model.compile(optimizer=adam, loss=['mse'], metrics=['mse'])

    # Get reference pretrained predictions 
    y_ref_pretrained = model.predict(np.ascontiguousarray(X_test))

    # callbacks = all_callbacks(stop_patience = 1000,
    #                           lr_factor = 0.5,
    #                           lr_patience = 10,
    #                           lr_epsilon = 0.000001,
    #                           lr_cooldown = 2,
    #                           lr_minimum = 0.0000001,
    #                           outputDir = 'model_dummy_forward')
    callbacks = all_callbacks(stop_patience = 10000000, outputDir = model_name)
    callbacks.callbacks.append(pruning_callbacks.UpdatePruningStep())
    model.fit(X_train_val, y_train_val, batch_size=16,
              epochs=8, validation_split=0.25, shuffle=True,
              callbacks = callbacks.callbacks)
    # Save the model again but with the pruning 'stripped' to use the regular layer types
    model = strip_pruning(model)
    # [@manuelbv]: Recompile
    model.compile(optimizer=adam, loss=['mse'], metrics=['mse'])
    model.save(f'{model_name}/KERAS_check_best_model.h5')
else:
    from tensorflow.keras.models import load_model
    from qkeras.utils import _add_supported_quantized_objects
    co = {}
    _add_supported_quantized_objects(co)
    model = load_model(f'{model_name}/KERAS_check_best_model.h5', custom_objects=co)

import sys
sys.path.append('/home/manuelbv/ETHW/')
import hls4ml

import plotting
hls4ml.model.optimizer.OutputRoundingSaturationMode.layers = ['Activation']
hls4ml.model.optimizer.OutputRoundingSaturationMode.rounding_mode = 'AP_RND'
hls4ml.model.optimizer.OutputRoundingSaturationMode.saturation_mode = 'AP_SAT'

config = hls4ml.utils.config_from_keras_model(model, granularity='name', 
                                                trainable = True)
#config['LayerName']['softmax']['exp_table_t'] = 'ap_fixed<18,8>'
#config['LayerName']['softmax']['inv_table_t'] = 'ap_fixed<18,4>'
print("-----------------------------------")
plotting.print_dict(config)
print("-----------------------------------")
hls_model = hls4ml.converters.convert_from_keras_model(model,
                                                       hls_config=config,
                                                       output_dir=f'{model_name}/hls4ml_prj',
                                                       part='xcu250-figd2104-2L-e')
hls_model.compile()

y_qkeras = model.predict(np.ascontiguousarray(X_test))
y_hls = hls_model.predict(np.ascontiguousarray(X_test))