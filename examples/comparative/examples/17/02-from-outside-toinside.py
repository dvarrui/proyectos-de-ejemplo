#!/usr/bin/env python3

def greet():
  name = 'Obiwan'
  print(f'Hello! I\'m {name}')

greet() # => Hello! I'm Obiwan

# Sin embargo, tratar de usar la variable name fuera de la función es un error.
print(name)
