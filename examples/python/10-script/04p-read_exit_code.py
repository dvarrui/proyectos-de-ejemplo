#!/usr/bin/env python

from subprocess import run

p = run( [ 'ping -c 1 192.168.1.1 > /dev/null' ] )
print( 'exit status code:', p.returncode )

p = run( [ 'ping -c 1 192.168.16.16 > /dev/null' ] )
print( 'exit status code:', p.returncode )
