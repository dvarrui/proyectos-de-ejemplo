
class Person:
  def __init__(self, name):
    self.__name = name

  def __olleh(self):
    print("Hello!, I am {}", self.__name)

  def hello(self):
    self.__olleh()


vader = Person("Vader")

vader.hello()
vader.__olleh()
print(vader.__name)

