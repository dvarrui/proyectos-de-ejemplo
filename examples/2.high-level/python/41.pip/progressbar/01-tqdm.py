#!/usr/bin/env python
from time import sleep
from tqdm import tqdm

bar = tqdm(range(0,100))

for i in range(0,50):
    bar.update(2)
    sleep(0.1)
