# Typing
from typing import Tuple, Union
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
    input_shape: Tuple[int] = field(init=False)
    output_shape: Tuple[int] = field(init=False)
    is_classification: bool = field(init=False)
    use_bias: bool = True

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
    units: list[int] = field(default_factory=lambda: [1])
    activations: Union[bool, list[str]] = True

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

        for units, act in zip(self.units, activs):
            x = tf.keras.layers.Dense(units, activation=act, use_bias=self.use_bias)(x)

        # Now call super to finalize the model
        return super()._build_model(inputs, x)
