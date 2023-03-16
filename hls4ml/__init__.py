from __future__ import absolute_import

__version__ = '0.6.0'

from . import converters
from . import report
from . import utils

def reseed(newseed):
    print('\npytest-randomly: reseed with {}'.format(newseed))
    try:
        import tensorflow
        tensorflow.random.set_seed(newseed)
    except ImportError:
        print('\nTensorFlow seed not set')
    try: 
        import torch
        torch.manual_seed(newseed)
    except ImportError:
        print('\nPyTorch seed not set')
