# Crear una clase en Python
class Person:
  def __init__(self, name):
    self.name = name

  def speak(self):
    print('My name is ' + self.name)


yoda = Person('yoda')
yoda.speak()
print(yoda.name)
