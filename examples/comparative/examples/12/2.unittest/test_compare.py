#!/usr/bin/env python3

import unittest

class TestCompare(unittest.TestCase):
  def test_greater(self):
    num = 101
    assert num > 100

  def test_greater_equal(self):
    num = 100
    assert num >= 100

  def test_less(self):
    num = 100
    assert num < 200
