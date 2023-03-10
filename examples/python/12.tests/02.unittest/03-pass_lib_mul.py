#!/usr/bin/env python3
import unittest
from lib.mul import *

class TestMul(unittest.TestCase):
    def test_mul_ints(self):
        data = [1, 2, 3]
        self.assertEqual(mul(data), 6)


unittest.main()
