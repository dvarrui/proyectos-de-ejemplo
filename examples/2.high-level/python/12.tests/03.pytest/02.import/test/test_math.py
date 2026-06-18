from sum import *
from src.mul import *

def test_sum():
    data = [1, 2, 3]
    assert sum(data), 6

def test_mul():
    data = [1, 2, 3]
    assert mul(data), 6
