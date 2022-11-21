
# Ocultación

> Enlaces de interés:
> * https://interactivechaos.com/es/manual/tutorial-de-python/ocultando-atributos-y-metodos-ii

## Python

En Python3 la forma de ocultar atributos y/o métodos es usar nombres que comiencen por doble guion bajo. Veamos un ejemplo:

```python

class Person:
  __rol = 'jedi'

  def __init__(self, name):
    self.name = name

  def __speak(self):
    print("Hello!, I am ", self.name)
    print("I'm ", Person.__rol)

  def hello(self):
    self.__speak()
```

|         | Atributo | Método    |
| ------- | -------- | --------- |
| Oculto  | __rol    | __speak() |
| Visible | name     | hello()   |
