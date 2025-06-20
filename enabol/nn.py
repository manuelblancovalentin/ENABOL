# Typing
from typing import Tuple, Union, Optional, Any
from abc import ABC, abstractmethod
from dataclasses import dataclass, field

# Numpy
import numpy as np # type: ignore

# Tensorflow
import tensorflow as tf # type: ignore

# Custom dataset class
from enabol.dataset import BaseDataset, DataType

@dataclass
class BaseModel(ABC):
    dataset: BaseDataset
    loss: Union[str, tf.keras.losses.Loss] = "mse"
    optimizer: Union[str, tf.keras.optimizers.Optimizer] = "adam"
    metrics: list = field(default_factory=lambda: [])
    model: tf.keras.Model = field(init=False)
    input_shape: Tuple[int, ...] = field(init=False)
    output_shape: Tuple[int, ...] = field(init=False)
    is_classification: bool = field(init=False)
    use_bias: bool = True
    name: Optional[str] = None

    @abstractmethod
    def build_model(self) -> tf.keras.Model:
        pass

    def __getattr__(self, name):
        return getattr(self.model, name)

    def __post_init__(self):
        self.input_shape = self.dataset.X.shape[1:]
        self.output_shape = self.dataset.Y.shape[1:]
        self.is_classification = self.dataset.output_type in {DataType.D1_CLASS, DataType.D2_CLASS, DataType.IMAGE_CLASS}
        self.model = self.build_model()

        # If model name is None, set to <class_name>_<inputs>_0w<hidden_units_layer0>_1w<hidden_units_layer1>_...<outputs>
        if self.name is None:
            self.name = self._get_alias()

    def _get_alias(self):
        return f"{self.__class__.__name__}_i{np.prod(self.input_shape)}_o{np.prod(self.output_shape)}"

    def forward(self, X: np.ndarray) -> np.ndarray:
        return self.model.predict(X)
    
    def _build_model(self, inputs, x) -> tf.keras.Model:
        """Builds the model using the dataset's input and output shapes."""

        # If this is classification, add softmax.
        outputs = x
        if self.is_classification:
            activation = "softmax"
            outputs = tf.keras.layers.Dense(self.output_shape[0], activation=activation, use_bias=self.use_bias)(x)
        else:
            activation = None
            # If the last layer's output shape is not exactly the output shape, we
            # need to add a final Dense layer to match it.
            if x.shape[1:] != self.output_shape:
                outputs = tf.keras.layers.Dense(self.output_shape[0], activation=activation, use_bias=self.use_bias)(x)
        
        model = tf.keras.Model(inputs=inputs, outputs=outputs)
        model.compile(optimizer=self.optimizer, loss=self.loss, metrics=self.metrics)
        return model
    
@dataclass
class MLPModel(BaseModel):
    """Multi-layer perceptron with configurable units and activations.

    Parameters
    ----------
    units : list of int
        List specifying number of neurons in each layer.
    activations : bool or list of str
        If False, use no activations. If True, use 'tanh'. If list, use explicitly.
    
    Usage 
    -----
    
    """
    units: 'list[int]' = field(default_factory=lambda: [1])
    activations: Union[bool, 'list[str]', 'Any'] = True
    # set the default name 
    name: Optional[str] = None

    def _get_alias(self):
        # Inputs:
        i = np.prod(self.input_shape)
        # Outputs:
        o = np.prod(self.output_shape)
        # Units per layer
        units_str = "_".join([f"{ily}w{u}" for ily, u in enumerate(self.units)])
        # Activations
        act_str = ""
        if isinstance(self.activations, list):
            # Keep acts that are not None
            activs = [act for act in self.activations if act is not None]
            if np.any(activs):
                act_str = f'_{activs[0]}'
        elif self.activations is True:
            act_str = "_tanh"
        
        # Return the alias
        return f"{self.__class__.__name__}_i{i}_o{o}_{units_str}{act_str}"

    def build_model(self) -> tf.keras.Model:
        """Builds a tf.keras.Model using the functional API."""
        inputs = tf.keras.Input(shape=self.input_shape)
        x = inputs

        # Process activations
        if isinstance(self.activations, list):
            activs = self.activations
        elif self.activations is True:
            activs = ['tanh'] * len(self.units)
        else:
            activs = [None] * len(self.units)

        # Set back to structure
        self.activations = activs

        for units, act in zip(self.units, activs):
            x = tf.keras.layers.Dense(units, activation=None, use_bias=self.use_bias)(x)

            # If activation is not None, apply it
            if act is not None:
                # If it's string try to pull it from keras.activations
                if isinstance(act, str):
                    try:
                        act = tf.keras.activations.get(act)
                        x = act(x)
                    except ValueError as e:
                        print(f"[WARNING] - Activation '{act}' not found. Using None instead.")
                elif hasattr(act, '__call__'):
                    # If it's callable, just call it
                    x = act(x)
                else:
                    raise ValueError(f"Invalid activation type: {type(act)}. Must be str or callable.")

        # Now call super to finalize the model
        return super()._build_model(inputs, x)
