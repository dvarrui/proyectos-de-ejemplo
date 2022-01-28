import sys

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        print "Hello! I am " + self.name

    # Ruby use to_s method name
    def __str__(self):
        return "Name: " + self.name + ", Age: " + str(self.age)

p = Person('Tomas', 44) # Ruby call new method to build instance
p.greet()
print p # Call __str__ method to convert object to String
