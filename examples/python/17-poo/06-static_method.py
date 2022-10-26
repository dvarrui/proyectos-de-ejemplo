#!/usr/bin/env python3
# https://pynative.com/python-static-method/

class Employee:
    @staticmethod
    def sample(x):
        print('Inside static method', x)

# call static method
Employee.sample(10)

# can be called using object
emp = Employee()
emp.sample(10)

