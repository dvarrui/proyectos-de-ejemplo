#!/usr/bin/env python3
# https://programmerclick.com/article/687019166/

# Los argumentos de palabras clave con nombre restringen los nombres de variables 
# de las palabras clave pasadas en función de los argumentos de palabras clave
#
# A diferencia de los argumentos de palabras clave comunes, los argumentos de palabras clave con nombre 
# requieren un separador para distinguirlos.*, 
# Los parámetros posteriores se consideran argumentos de palabra clave
#
# Aquí la ciudad y el trabajo después del delimitador de asterisco se denominan argumentos de palabras clave

def person_info(name, age, *, city, job):
    print(name, age, city, job)
 
person_info("Alex", 17, city = "Beijing", job = "Engineer")
person_info("Alex", 17, job = "Engineer", city = "Beijing")

