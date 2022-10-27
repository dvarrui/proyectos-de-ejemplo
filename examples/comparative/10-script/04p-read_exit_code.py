#!/usr/bin/env python3

import os

retcode = os.system('ping -c 1 1.1.1.1 > /dev/null 2> /dev/null')
print( 'exit status code:', retcode)

retcode = os.system('ping -c 1 192.168.16.16 > /dev/null 2> /dev/null')
print( 'exit status code:', retcode)
