#!/usr/bin/env python3
# https://pynative.com/python-static-method/

class Person:
    rol = "jedi"

    def __init__(self, name):
        self.name = name

    @staticmethod
    def class_method():
        print('Inside class method: rol=')

    def instance_method(self):
        print('Inside instance method: name=' + self.name + ", rol=" + self.rol)

# call static method
Person.class_method()

# can be called using object
yoda = Person("Yoda")
yoda.instance_method()
yoda.class_method()
