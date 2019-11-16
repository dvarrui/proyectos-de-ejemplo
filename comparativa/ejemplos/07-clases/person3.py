import sys

class Person:
    country = 'Spain'
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "Name: " + self.name + ", Age: " + str(self.age)

    def imfrom(cls):
        print "I'm from " + cls.country

    @staticmethod
    def talk():
        print('bla, bla, bla')

# Person.greet() => TypeError: unbound method greet() must be called with Person instance as first argument (got nothing instead)
p = Person('Jane',0)
p.imfrom() # Python couldn't invoke class methods without instance.
Person.talk()
