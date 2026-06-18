#!/usr/bin/env python3
# https://www.geeksforgeeks.org/decorators-in-python/
import time
import math
 
def calculate_time(func):
    def inner1(*args, **kwargs):
        begin = time.time()
        func(*args, **kwargs)
        end = time.time()
        print("Total time taken in : ", func.__name__, end - begin)
 
    return inner1
 
@calculate_time
def factorial(num):
    time.sleep(2)
    print(math.factorial(num))
 
factorial(10)

