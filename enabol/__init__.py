""" Point to the local hls4ml directory and try to import it."""
import os, sys

# Get ENABOL_ROOT_DIR
ENABOL_ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

# Get hls4ml dir
LOCAL_HLS4ML_PARENT_DIR = os.path.dirname(ENABOL_ROOT_DIR)
LOCAL_HLS4ML_DIR = os.path.join(LOCAL_HLS4ML_PARENT_DIR, 'hls4ml')
if os.path.exists(LOCAL_HLS4ML_DIR):
    sys.path.insert(0, LOCAL_HLS4ML_PARENT_DIR)
    print(f'[INFO] - hls4ml path imported from local dir {LOCAL_HLS4ML_DIR}')
else:
    raise ImportError(f"Local hls4ml directory not found at {LOCAL_HLS4ML_DIR}. Please check the path.")

# Try to import 
try:
    import hls4ml
    print(f'[INFO] - hls4ml version: {hls4ml.__version__}')
except ImportError as e:
    raise ImportError(f"Failed to import hls4ml. Ensure that the hls4ml package is correctly installed in {LOCAL_HLS4ML_DIR}.") from e



""" Let's read the configuration file """
import yaml
config_file = os.path.join(ENABOL_ROOT_DIR, 'config', 'config.yaml')
ENABOL_CONFIG = {}
if os.path.exists(config_file):
    with open(config_file, 'r') as file:
        ENABOL_CONFIG = yaml.safe_load(file)
    print(f'[INFO] - Configuration loaded from {config_file}')

    # Let's now process this config to set the appropriate variables for compilers, etc.
    


""" Import submodules """
from .  import dataset
from . import nn
from . import dtypes
from .compile import compile_model

