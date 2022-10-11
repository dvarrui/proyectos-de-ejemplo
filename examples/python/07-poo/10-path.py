#!/usr/bin/env python3

from pathlib import Path

class Klass():
    def __init__(self):
        print(Path(__file__).name)
        print(Path(__file__).stem)


k = Klass()
