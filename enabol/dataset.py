# Typing
from dataclasses import dataclass, field
from typing import Tuple, Optional

# Basics
from enum import Enum

# Numpy
import numpy as np # type: ignore

# Visualization
import matplotlib.pyplot as plt # type: ignore


# ---------------------------

class DataType(Enum):
    """Enumeration of dataset input/output types for visualization and processing.

    Each enum value represents the structure and nature of the data:
    - IMAGE_CLASS: 2D image with class labels (e.g., segmentation map).
    - IMAGE_FLOAT: 2D image with continuous pixel values.
    - D1_CLASS: 1D feature input/output with classification labels.
    - D1_FLOAT: 1D feature input/output with continuous values (regression).
    - D2_CLASS: 2D feature space with classification (e.g., one-hot labels).
    - D2_FLOAT: 2D feature space with continuous targets.
    """
    IMAGE_CLASS = "image-class"
    IMAGE_FLOAT = "image-float"
    D1_CLASS = "1d-class"
    D1_FLOAT = "1d-float"
    D2_CLASS = "2d-class"
    D2_FLOAT = "2d-float"



@dataclass
class BaseDataset:
    """Base class for datasets used in ENABOL training and testing.

    Attributes
    ----------
    X : np.ndarray
        Input features of the dataset.
    Y : np.ndarray
        Target outputs corresponding to X.
    """

    X: np.ndarray = field(init=False)
    Y: np.ndarray = field(init=False)
    input_type: DataType = field(init=False)
    output_type: DataType = field(init=False)

    def get(self) -> Tuple[np.ndarray, np.ndarray]:
        """Returns the dataset as a tuple of (X, Y).

        Returns
        -------
        tuple of np.ndarray
            The input features and target outputs.
        """
        return self.X, self.Y

    def to_numpy(self) -> Tuple[np.ndarray, np.ndarray]:
        """Returns the dataset as NumPy arrays.

        Returns
        -------
        tuple of np.ndarray
            X and Y arrays.
        """
        return self.get()

    def to_txt(self, prefix: str = "dataset") -> None:
        """Saves the dataset to text files using NumPy's `savetxt`.

        Parameters
        ----------
        prefix : str, optional
            Prefix for the output filenames, by default "dataset".

        Notes
        -----
        Two files will be saved:
        - <prefix>_X.txt
        - <prefix>_Y.txt
        """
        np.savetxt(f"{prefix}_X.txt", self.X)
        np.savetxt(f"{prefix}_Y.txt", self.Y)

    def plot(self, max_points: int = 100) -> None:
        """Visualize the dataset based on input and output tags.

        Parameters
        ----------
        max_points : int, optional
            Max number of points to plot for large datasets.
        """

        X = self.X[:max_points]
        Y = self.Y[:max_points]

        if self.input_type == DataType.D1_FLOAT and self.output_type == DataType.D1_FLOAT:
            plt.scatter(X, Y, alpha=0.7)
            plt.xlabel("X")
            plt.ylabel("Y")
            plt.title("1D Float Regression")
            plt.grid(True)
            plt.show()
        elif self.input_type == DataType.D1_FLOAT and self.output_type == DataType.D1_CLASS:
            plt.scatter(X, Y.argmax(axis=1) if Y.ndim > 1 else Y, alpha=0.7)
            plt.xlabel("X")
            plt.ylabel("Class")
            plt.title("1D Classification")
            plt.grid(True)
            plt.show()
        else:
            print("Plotting not implemented for this data type combination.")


@dataclass
class LinearDataset(BaseDataset):
    """Generates a simple linear dataset with Gaussian noise.

    Y = weight * X + noise

    Parameters
    ----------
    n_samples : int, optional
        Number of samples to generate, by default 100.
    noise_std : float, optional
        Standard deviation of Gaussian noise added to Y, by default 0.1.
    weight : float, optional
        Coefficient applied to X, by default 0.5.
    seed : int or None, optional
        Random seed for reproducibility, by default None.

    Usage
    -----
    # Create a simple linear regression dataset
    dataset = LinearDataset(n_samples = 200, weight = 0.5, noise_std = 0.0, seed = 42)

    # Access the data 
    X, Y = dataset.get()
    print("X shape:", X.shape)
    print("Y shape:", Y.shape)

    # Visualize
    dataset.plot()
    """

    n_samples: int = 100
    noise_std: float = 0.0
    weight: float = 0.5
    seed: Optional[int] = None

    def __post_init__(self):
        rng = np.random.default_rng(self.seed)
        self.X = rng.normal(0, 1, (self.n_samples, 1))
        self.Y = self.weight * self.X + rng.normal(0, self.noise_std, (self.n_samples, 1))
        self.input_type = DataType.D1_FLOAT
        self.output_type = DataType.D1_FLOAT

@dataclass
class PolynomialDataset(BaseDataset):
    """Generates a polynomial regression dataset.

    Y = a_0 + a_1*X + a_2*X^2 + ... + a_n*X^n + noise

    Parameters
    ----------
    n_samples : int, optional
        Number of samples to generate, by default 100.
    degree : int, optional
        Degree of the polynomial, by default 2.
    coeffs : np.ndarray or None, optional
        Polynomial coefficients (length = degree + 1). If None, they are sampled randomly.
    x_range : tuple of float, optional
        Range of X values, by default (-1, 1).
    noise_std : float, optional
        Standard deviation of noise added to Y, by default 0.05.
    seed : int or None, optional
        Random seed for reproducibility, by default None.
    
    Usage
    -----
    # Create a quadratic dataset: Y ≈ a0 + a1*X + a2*X^2
    dataset = PolynomialDataset(n_samples=200, degree=2, seed=123)

    # Access data
    X, Y = dataset.to_numpy()
    print("Coefficients:", dataset.coeffs)
    print("First 5 X samples:", X[:5])
    print("First 5 Y samples:", Y[:5])

    # Plot
    dataset.plot()
    """

    n_samples: int = 100
    degree: int = 2
    coeffs: Optional[np.ndarray] = None
    x_range: Tuple[float, float] = (-1, 1)
    noise_std: float = 0.05
    seed: Optional[int] = None

    def __post_init__(self):
        rng = np.random.default_rng(self.seed)
        self.X = rng.uniform(*self.x_range, (self.n_samples, 1))

        if self.coeffs is None:
            self.coeffs = rng.normal(0, 1, self.degree + 1)
        else:
            self.coeffs = np.asarray(self.coeffs)

        powers = np.hstack([self.X**d for d in range(self.degree + 1)])
        self.Y = powers @ np.reshape(self.coeffs, (-1, 1)) + rng.normal(0, self.noise_std, (self.n_samples, 1))
        self.input_type = DataType.D1_FLOAT
        self.output_type = DataType.D1_FLOAT