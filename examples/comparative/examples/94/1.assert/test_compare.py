#!/usr/bin/env python3

def test_greater():
   num = 101
   assert num > 100, "Should be greater"

def test_greater_equal():
   num = 100
   assert num >= 100, "Should be greater or equal"

def test_less():
   num = 100
   assert num < 200, "Should be less"

test_greater()
test_greater_equal()
test_less()
