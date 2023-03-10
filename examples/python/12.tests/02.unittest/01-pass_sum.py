#!/usr/bin/env python3

import unittest

from my_sum11 import sum


class TestSum(unittest.TestCase):
    def test_sum_ints(self):
        data = [1, 2, 3]
        self.assertEqual(sum(data), 6)


if __name__ == '__main__':
    unittest.main()

