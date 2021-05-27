import io
import sys
from _typeshed import AnyPath, ReadableBuffer, WriteableBuffer
from typing import IO, Any, Iterable, List, Optional, TextIO, TypeVar, Union, overload
from typing_extensions import Literal, SupportsIndex

_PathOrFile = Union[AnyPath, IO[bytes]]
_T = TypeVar("_T")

def compress(data: bytes, compresslevel: int = ...) -> bytes: ...
def decompress(data: bytes) -> bytes: ...

_OpenBinaryMode = Literal["r", "rb", "w", "wb", "x", "xb", "a", "ab"]
_OpenTextMode = Literal["rt", "wt", "xt", "at"]

@overload
def open(
    filename: _PathOrFile,
    mode: _OpenBinaryMode = ...,
    compresslevel: int = ...,
    encoding: None = ...,
    errors: None = ...,
    newline: None = ...,
) -> BZ2File: ...
@overload
def open(
    filename: AnyPath,
    mode: _OpenTextMode,
    compresslevel: int = ...,
    encoding: Optional[str] = ...,
    errors: Optional[str] = ...,
    newline: Optional[str] = ...,
) -> TextIO: ...
@overload
def open(
    filename: _PathOrFile,
    mode: str,
    compresslevel: int = ...,
    encoding: Optional[str] = ...,
    errors: Optional[str] = ...,
    newline: Optional[str] = ...,
) -> Union[BZ2File, TextIO]: ...

class BZ2File(io.BufferedIOBase, IO[bytes]):
    def __enter__(self: _T) -> _T: ...
    if sys.version_info >= (3, 9):
        def __init__(self, filename: _PathOrFile, mode: str = ..., *, compresslevel: int = ...) -> None: ...
    else:
        def __init__(
            self, filename: _PathOrFile, mode: str = ..., buffering: Optional[Any] = ..., compresslevel: int = ...
        ) -> None: ...
    def read(self, size: Optional[int] = ...) -> bytes: ...
    def read1(self, size: int = ...) -> bytes: ...
    def readline(self, size: SupportsIndex = ...) -> bytes: ...  # type: ignore
    def readinto(self, b: WriteableBuffer) -> int: ...
    def readlines(self, size: SupportsIndex = ...) -> List[bytes]: ...
    def seek(self, offset: int, whence: int = ...) -> int: ...
    def write(self, data: ReadableBuffer) -> int: ...
    def writelines(self, seq: Iterable[ReadableBuffer]) -> None: ...

class BZ2Compressor(object):
    def __init__(self, compresslevel: int = ...) -> None: ...
    def compress(self, __data: bytes) -> bytes: ...
    def flush(self) -> bytes: ...

class BZ2Decompressor(object):
    def decompress(self, data: bytes, max_length: int = ...) -> bytes: ...
    @property
    def eof(self) -> bool: ...
    @property
    def needs_input(self) -> bool: ...
    @property
    def unused_data(self) -> bytes: ...
