
# https://twitter.com/fermatslibrary/status/1583080863692050432?t=6ri4ktwW77DWB1J7Vy_JSA&s=35
# Twitter (https://twitter.com/fermatslibrary/status/1583080863692050432?t=6ri4ktwW77DWB1J7Vy_JSA&s=35)
# Fermat's Library
# The 8 queens problem solved with 6 lines of python: 

from itertools import permutations
col = range(8)
for vec in permutations(col):
    if (8 == len(set(vec[i]+i for i in col))
          == len(set(vec[i]-i for i in col))):
        print(vec)

