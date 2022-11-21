
class Person:
  __rol = 'jedi'

  def __init__(self, name):
    self.name = name

  def __speak(self):
    print("Hello!, I am ", self.name)
    print("I'm ", Person.__rol)

  def hello(self):
    self.__speak()
