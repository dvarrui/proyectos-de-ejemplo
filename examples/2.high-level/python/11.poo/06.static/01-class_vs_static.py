#!/usr/bin/env python3
import sys

class Person:
    country = 'Spain'

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "Name: " + self.name + ", Age: " + str(self.age)

    def imfrom(cls):
        print("I'm from " + cls.country)

    @staticmethod
    def talk():
        print('bla, bla, bla')

p = Person('Jane',0)
p.imfrom()    # Instance method
Person.talk() # Static class method
