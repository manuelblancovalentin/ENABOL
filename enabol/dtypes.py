from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from typing import Optional

# Valid quantization and overflow modes for HLS types
VALID_QMODES = {"AP_RND", "AP_TRN", "AP_RND_CONV", "AP_RND_ZERO", "AP_RND_MIN_INF", "AP_RND_INF"}
VALID_OMODES = {"AP_WRAP", "AP_SAT", "AP_SAT_ZERO", "AP_SAT_SYM"}

@dataclass
class HLSDataType(ABC):
    """Abstract base class for HLS data types."""
    dtype: str = field(init=False)

    @staticmethod
    def from_dtype(dtype: str, **kwargs) -> 'HLSDataType':
        """Factory method to create an instance of HLSDataType from a string."""
        if dtype == "ap_fixed":
            return ap_fixed(**kwargs)
        elif dtype == "ap_ufixed":
            return ap_ufixed(**kwargs)
        elif dtype == "ap_int":
            return ap_int(**kwargs)
        elif dtype == "ap_uint":
            return ap_uint(**kwargs)
        else:
            raise ValueError(f"Unsupported data type: {dtype}")

    def _repr_(self, *args):
        return f"{self.dtype}<" + ",".join(map(str, args)) + ">"

    def __repr__(self):
        return self._repr_()
    
    @abstractmethod
    def double_precision(self) -> 'HLSDataType':
        """Returns a double precision version of the given HLS data type."""
        pass


@dataclass
class ap_fixed(HLSDataType):
    WL: int = 16
    IWL: int = 6
    QMODE: str = "AP_TRN"
    OMODE: str = "AP_WRAP"
    SAT_BITS: int = 0
    dtype: str = field(init=False, default="ap_fixed")

    def __post_init__(self):
        assert self.IWL <= self.WL, "IWL must be ≤ WL"
        assert self.QMODE in VALID_QMODES, f"QMODE must be one of {VALID_QMODES}"
        assert self.OMODE in VALID_OMODES, f"OMODE must be one of {VALID_OMODES}"
        assert self.SAT_BITS >= 0, "SAT_BITS must be >= 0"

    def __repr__(self):
        args = [str(self.WL), str(self.IWL)]
        if self.QMODE != "AP_TRN":
            args.append(str(self.QMODE))
        if self.OMODE != "AP_WRAP":
            # If QMODE is default but OMODE isn't, must add QMODE for position
            if len(args) == 2:
                args.append(str(self.QMODE))
            args.append(str(self.OMODE))
        if self.SAT_BITS != 0:
            # If OMODE is default but SAT_BITS isn't, must add OMODE for position
            if (self.OMODE == "AP_WRAP") and (self.QMODE == "AP_TRN"):
                # need to add QMODE and OMODE
                args.append(str(self.QMODE))
                args.append(str(self.OMODE))
            elif self.OMODE == "AP_WRAP":
                args.append(str(self.OMODE))
            args.append(str(self.SAT_BITS))
        return super()._repr_(*args)
    
    """Returns a double precision version of the given HLS data type."""
    def double_precision(self) -> 'HLSDataType':
        return ap_fixed(WL=self.WL + 1, IWL=self.IWL + 1, 
                        QMODE=self.QMODE, 
                        OMODE=self.OMODE, 
                        SAT_BITS=self.SAT_BITS)


@dataclass
class ap_ufixed(HLSDataType):
    WL: int = 16
    IWL: int = 6
    QMODE: str = "AP_TRN"
    OMODE: str = "AP_WRAP"
    SAT_BITS: int = 0
    dtype: str = field(init=False, default="ap_ufixed")

    def __post_init__(self):
        assert self.IWL <= self.WL, "IWL must be ≤ WL"
        assert self.QMODE in VALID_QMODES, f"QMODE must be one of {VALID_QMODES}"
        assert self.OMODE in VALID_OMODES, f"OMODE must be one of {VALID_OMODES}"
        assert self.SAT_BITS >= 0, "SAT_BITS must be >= 0"

    def __repr__(self):
        args = [str(self.WL), str(self.IWL)]
        if self.QMODE != "AP_TRN":
            args.append(str(self.QMODE))
        if self.OMODE != "AP_WRAP":
            if len(args) == 2:
                args.append(str(self.QMODE))
            args.append(str(self.OMODE))
        if self.SAT_BITS != 0:
            if (self.OMODE == "AP_WRAP") and (self.QMODE == "AP_TRN"):
                args.append(str(self.QMODE))
                args.append(str(self.OMODE))
            elif self.OMODE == "AP_WRAP":
                args.append(str(self.OMODE))
            args.append(str(self.SAT_BITS))
        return super()._repr_(*args)
    
    # Returns a double precision version of the given HLS data type.
    def double_precision(self) -> 'HLSDataType':
        return ap_ufixed(WL=self.WL + 1, IWL=self.IWL + 1, 
                         QMODE=self.QMODE, 
                         OMODE=self.OMODE, 
                         SAT_BITS=self.SAT_BITS)


@dataclass
class ap_int(HLSDataType):
    WL: int = 16
    dtype: str = field(init=False, default="ap_int")

    def __repr__(self):
        return super()._repr_(self.WL)

    # Returns a double precision version of the given HLS data type.
    def double_precision(self) -> 'HLSDataType':
        return ap_int(WL=self.WL + 1)


@dataclass
class ap_uint(HLSDataType):
    WL: int = 16
    dtype: str = field(init=False, default="ap_uint")

    def __repr__(self):
        return super()._repr_(self.WL)
    
    # Returns a double precision version of the given HLS data type.
    def double_precision(self) -> 'HLSDataType':
        return ap_uint(WL=self.WL + 1)