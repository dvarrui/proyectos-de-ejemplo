#!/usr/bin/env python3

import unittest
import math

class TestSquare(unittest.TestCase):
  def test_sqrt(self):
    num = 25
    assert math.sqrt(num) == 5

  def testsquare(self):
    num = 7
    assert 7*7 == 49

  def tesequality(self):
    assert 10 == 11


if __name__ == '__main__':
    unittest.main()
