#!/usr/bin/env python

class Persona:
    def __init__(self, nombre):
        self.nombre = nombre

    def __str__(self):
        return "Nombre: %s" % (self.nombre)

p = Persona("Sergio")
print p
