#!/usr/bin/env python

import sys

def mayor_de_edad(edad):
    if int(edad) >= 18:
        return "Eres MAYOR de edad"
    return "Eres MENOR"

print mayor_de_edad(sys.argv[1])
