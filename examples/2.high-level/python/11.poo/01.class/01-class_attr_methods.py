#!/usr/bin/env python3
import sys

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        print("Hello! I am " + self.name)

    # Ruby use to_s method name
    def __str__(self):
        return "Name: " + self.name + ", Age: " + str(self.age)

p = Person('Yoda', 900) # Ruby call new method to build instance
p.greet()
print(p)                # Python call __str__ method to convert object to String

Person('Obiwan', 53).greet()
