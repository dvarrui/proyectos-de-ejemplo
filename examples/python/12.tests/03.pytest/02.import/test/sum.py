
from pathlib import Path
from .src.sum import *

def test_sum():
    data = [1, 2, 3]
    assert sum(data), 6
