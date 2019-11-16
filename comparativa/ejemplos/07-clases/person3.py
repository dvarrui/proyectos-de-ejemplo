import sys

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "Name: " + self.name + ", Age: " + str(self.age)

    def greet(cls):
        print "Hello!"

# Person.greet() => TypeError: unbound method greet() must be called with Person instance as first argument (got nothing instead)
p = Person('None',0)
p.greet()
