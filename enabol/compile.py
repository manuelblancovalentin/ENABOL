"""

"""
# Typing
from typing import Optional

# basic imports
import os
import json
import subprocess

# Import hls4ml 
from enabol import hls4ml, ENABOL_CONFIG
from .nn import BaseModel
from .dtypes import HLSDataType


def _safe_set_env_var(var_name, value):
    """Safely set an environment variable."""
    if var_name not in os.environ:
        os.environ[var_name] = value
        print(f'[INFO] - Set {var_name} to {value}')
    elif value not in os.environ[var_name]:
        os.environ[var_name] += ':' + value
        print(f'[INFO] - Added {value} to {var_name} environment variable')
    else:
        print(f'[INFO] - {value} already in {var_name} environment variable')

def _set_compiler_env_vars(backend: str):
    # Ensure paths as in config:
    for key, value in ENABOL_CONFIG['compiler']['basic'].items():
        _safe_set_env_var(key, value)

    # Now for backend 
    for key, value in ENABOL_CONFIG['compiler'][backend].items():
        _safe_set_env_var(key, value)


""" Check if the specified backend is in path. """
def _check_backend(backend: str = 'vivado', PATH = '/fpga/cad/xilinx/Vivado/2019.2/bin'):
    
    # Make sure we apply some mapping (e.g. 'Vivado' -> 'vivado')
    backend = {'Vivado': 'vivado'}.get(backend, backend)

    # Set compiler environment variables
    _set_compiler_env_vars(backend)
    
    process = subprocess.Popen(['which', backend], stdout=subprocess.PIPE)
    output, errors = process.communicate() # Wait for process to finish and get output
    
    if process.returncode != 0 or not output.strip():
        # Check if PATH was passed 
        if os.path.isfile(PATH):
            print(f"[INFO] - {backend} found at {PATH}.")
            os.environ['PATH'] = PATH + ':' + os.environ['PATH']
        else:
            if os.environ.get('ENABOL_SKIP_BACKEND_CHECK', 'False').lower() == 'true':
                print(f"[WARNING] - {backend} not found in PATH, but skipping check as per ENABOL_SKIP_BACKEND_CHECK environment variable.")
                return
            raise FileNotFoundError(f"[ERROR] - {backend} not found in PATH. Please install {backend} or provide a valid PATH. If you want to skip this error, set ENV variable ENABOL_SKIP_BACKEND_CHECK to True.")


""" Compile a model using hls4ml with the specified parameters."""
def compile_model(model: BaseModel, 
                  part: str = 'xcku035-fbva676-2-e',
                  io_type: str = 'io_parallel',
                  backend: str = 'Vivado',
                  strategy: str = 'Latency',
                  reuse_factor: int = 1,
                  tracing: bool = True,
                  granularity: str = 'name',
                  trainable: bool = True,
                  precision: Optional["dict[str, dict[str, HLSDataType]]"] = dict(),
                  default_precision: HLSDataType = HLSDataType.from_dtype(dtype='ap_fixed', WL=16, IWL=6),
                  verbose: bool = True,
                  overwrite: bool = False,
                  output_dir: Optional[str] = None):

    # [@manuelblancovalentin] First we need to assert some stuff. 
    assert io_type in ['io_parallel', 'io_stream'], "IO Type must be either 'io_parallel' or 'io_stream'."
    assert backend in ['Vivado'], "Only 'Vivado' backend is supported for now."
    assert strategy in ['Latency', 'Resource'], "Strategy must be either 'Latency' or 'Resource'."
    assert isinstance(reuse_factor, int) and reuse_factor > 0, "Reuse factor must be a positive integer."
    
    # Check if the backend is in path
    _check_backend(backend)

    # Call hls4ml utils to get the config from the keras model
    config = hls4ml.utils.config_from_keras_model(model.model,
                                                    default_precision = repr(default_precision),
                                                    granularity = granularity,
                                                    trainable = trainable)

    # Modify some parameters in the config
    config['IOType'] = io_type
    config['backend'] = backend
    config['XilinxPart'] = part
    config["Model"]["Strategy"] = strategy
    config["Model"]["ReuseFactor"] = reuse_factor
    for layer in config["LayerName"]:
        config["LayerName"][layer]["Trace"] = tracing

    # Let's initialize the precision dict for each layer to the default precision in case it is not set explicitly
    if precision is None:
        precision = {}
    for layer in config["LayerName"]:
        if layer not in precision:
            precision[layer] = {}
        if 'weight' not in precision[layer]:
            precision[layer]['weight'] = default_precision
        if 'bias' not in precision[layer]:
            precision[layer]['bias'] = default_precision
        if 'result' not in precision[layer]:
            # Create a double precision for the result in case 
            dp = default_precision.double_precision()
            precision[layer]['result'] = dp
        
    # Loop thru layers and set precision and reuse factor automatically depending on layer type
    for layer in config["LayerName"]:
        
        # Make sure we have a Precision dict for each layer
        if isinstance(config["LayerName"][layer]["Precision"], str):
            config["LayerName"][layer]["Precision"] = {}

        # Parse the type of layer
        if "conv_" in layer or "dense_" in layer:
            # Set the precision for weight and bias explicitly (skip for the rest)
            config["LayerName"][layer]["Precision"]["weight"] = repr(precision[layer]['weight'])
            config["LayerName"][layer]["Precision"]["bias"] = repr(precision[layer]['bias'])
        else:
            # Warn the user that we are skipping weight/bias because this is probably not a weight layer
            if 'weight' in precision[layer] or 'bias' in precision[layer]:
                print(f"[WARN] - Layer '{layer}' is not a weight layer, skipping precision for weight and bias.")
            
        # Always set the precision for the result
        config["LayerName"][layer]["Precision"]["result"] = repr(precision[layer]['result'])

        # In any case, always set reuse factor and strategy
        config["LayerName"][layer]["ReuseFactor"] = reuse_factor
        config["LayerName"][layer]["Strategy"] = strategy

    # Print the config for debugging purposes
    if verbose:
        print("[INFO] - HLS4ML configuration:")
        print(json.dumps(config, indent=2))

    # If the output directory exists and exist_ok is False, raise an error
    if output_dir is None:
        # Build it from the model name
        output_dir = os.path.join(os.getcwd(), model.name) # type: ignore
        print(f"[INFO] - Output directory not specified, using default: {output_dir}")
    elif model.name != os.path.basename(output_dir):
        # If the output directory is specified but does not match the model name, warn the user
        print(f"[WARN] - Output directory '{output_dir}' does not match model name '{model.name}'. This may lead to confusion. Adding it automatically.")
        output_dir = os.path.join(output_dir, model.name) # type: ignore

    if os.path.exists(output_dir) and not overwrite: # type: ignore
        raise FileExistsError(f"[ERROR] - Output directory '{output_dir}' already exists. Use 'overwrite=True' to overwrite it.")

    # Finally, we convert the model using hls4ml
    hls_model = hls4ml.converters.convert_from_keras_model(model.model,
                                                        hls_config = config,
                                                        io_type = io_type,
                                                        backend = backend,
                                                        output_dir = output_dir, # type: ignore
                                                        part = part
                                                        )
    
    # Try to compile the model
    try:
        hls_model.compile()
        print(f"[INFO] - HLS model compiled successfully and saved to {output_dir}.")
    except Exception as e:
        print(f"[ERROR] - Failed to compile HLS model: {e}")
    
    return hls_model, config
