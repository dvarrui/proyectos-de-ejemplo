#!/usr/bin/env python3
# https://programmerclick.com/article/687019166/

def calc(*nums):
    sum = 0
    for n in nums:
        sum += n
    return sum
 
print(calc(1,2,3))

my_ls = [1,2,3]
print(calc(*my_ls))

