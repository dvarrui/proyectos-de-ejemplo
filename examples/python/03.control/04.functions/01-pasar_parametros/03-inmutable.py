#!/usr/bin/env python3
# https://programmerclick.com/article/687019166/
# Los parmetros predeterminados deben apuntar a objetos inmutables

# La siguiente funcin agregar mltiples cadenas END por defecto si se llama varias veces
def add_end1(arr=[]):
    arr.append('END')
    return arr

# Para evitar este problema, los parámetros predeterminados pasados ​​deben ser inmutables
def add_end2(arr=None):
    arr = []
    arr.append('END')
    return arr

a = ["lista1"]
add_end1(a)
add_end1(a)
print(a)

b = ["lista2"]
add_end2(b)
add_end2(b)
print(b)
