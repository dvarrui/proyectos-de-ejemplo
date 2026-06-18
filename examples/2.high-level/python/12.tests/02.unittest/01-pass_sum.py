#!/usr/bin/env python3
import unittest

class TestSum(unittest.TestCase):
    def test_sum_ints(self):
        data = [1, 2, 3]
        self.assertEqual(sum(data), 6)


unittest.main()
