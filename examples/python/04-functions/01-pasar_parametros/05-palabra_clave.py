#!/usr/bin/env python3
# https://programmerclick.com/article/687019166/
# Parámetros de palabras clave con dos asteriscos

def person_info(name, age, **kw):
    print("name", name, "age", age, "other", kw)
 
person_info("Xiaoming", 12)
person_info("Dahuang", 35, city = "Beijing")

