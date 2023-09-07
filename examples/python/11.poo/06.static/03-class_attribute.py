#!/usr/bin/env python
import time

class A:
    timestamp = time.time()

    @staticmethod
    def show():
        current = time.time()
        delta = (current - self.timestamp)
        print(delta)
        # Esto no se puede hacer en Python
        self.timestamp = current

A.show()
