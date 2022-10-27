#!/usr/bin/env python3

import subprocess

p = subprocess.run( [ 'ping', '-c', '1', '8.8.8.8' ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL )
print( 'exit status code:', p.returncode )

p = subprocess.run( [ 'ping', '-c', '1', '192.168.16.16' ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL )
print( 'exit status code:', p.returncode )

import os

retcode = os.system('ping -c 1 8.8.8.8 > /dev/null 2> /dev/null')
print( 'exit status code:', retcode)
