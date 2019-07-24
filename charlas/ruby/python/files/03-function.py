#!/usr/bin/env python

import sys

def mayor_de_edad(edad):
    if edad >= 18:
        return "Eres MAYOR de edad"
    return "Eres MENOR"

print mayor_de_edad(int(sys.argv[1]))
