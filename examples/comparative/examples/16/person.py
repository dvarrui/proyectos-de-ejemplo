#!/usr/bin/env python3

class Person:
  __rol = 'jedi'

  def __init__(self, name):
    self.name = name

  def hello1(self):
    print("Hello1:", self.name)

  def hello2(self):
    self.__hello3()

  def __hello3(self):
    print("Hello3:", self.name, "(", Person.__rol, ")")

yoda = Person("Yoda")
yoda.hello1()
yoda.hello2()
print(str(dir(yoda)))
yoda._Person__hello3()
print(yoda._Person__rol)
