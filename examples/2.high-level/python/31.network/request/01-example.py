#!/usr/bin/env python

# from .network import Network
import network
import time
import pdb

filepath = 'private.txt'
with open(filepath, 'r') as f:
    content = f.read()

urls = content.split('\n')
urls.remove('')

for url in urls:
    content = network.Network.read_content(url)
    print('.')
