#!/usr/bin/env python3

import math

def test_sqrt():
   num = 25
   assert math.sqrt(num) == 5, "Should be 5"

def testsquare():
   num = 7
   assert 7*7 == 49, "Should by 49"

def tesequality():
   assert 10 == 11, "Should FAIL"


test_sqrt()
testsquare()
tesequality()
