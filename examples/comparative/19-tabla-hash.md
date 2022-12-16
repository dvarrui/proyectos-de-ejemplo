[<<back](README.md)

# Diccionario, Hash o Mapa.

## Definición

https://es.wikipedia.org/wiki/Tabla_hash

Una tabla hash, matriz asociativa, hashing, mapa hash, tabla de dispersión o tabla fragmentada es una estructura de datos que implementa el tipo de dato abstracto llamado Diccionario.
* Asocia llaves o claves con valores.
* La operación principal que soporta de manera eficiente es la búsqueda: permite el acceso a los elementos (values) almacenados a partir de una clave (key).
* Funciona transformando la clave con una función hash en un hash, un número que identifica la posición (casilla o cubeta) donde la tabla hash localiza el valor deseado.

## Recorrido por defecto

Ejemplo recorriendo un Diccionario/Hash en Python:

```python
h1 = { 'a': 1, 'b':2, 'c': 3}
type(h1) # => <type 'dict'>

for i in h1:
    print(i)
```

Salida
```
a
c
b
```

En Python se asume por defecto que la iteración sobre un Diccionario/Hash se va a realizar sobre los campos clave (Keys).

```ruby
h2 = {'a': 1, 'b':2, 'c':2}
h2.class  # => Hash

for i in h2
   puts(i)
end
```

Salida

```
a
1                                       
b                                       
2                                       
c                                       
2                                       
```

¿Qué ocurre aquí?... Lo que pasa es que por defecto Ruby cuando itera sobre un Hash/Diccionario, lo hace por el item completo. Esto es, "key:value". Y al imprimirlo (`puts`) se muestran tanto la clave como el valor.

## Otros recorridos

Si queremos realizar una iteración sobre las claves solamente hacemos:

```ruby
for k in h2.keys
   puts(k)
end
```

Salida
```
a
b                                              
c     
```

Y si queremos iterar solamente por los valores, hacemos:

```ruby
for v in h2.values
   puts(v)
end
```

¿Cómo lo hacemos en Python?... ¡igual!

```python
for k in h1.keys():
    print(k)
```

Salida
```
a
c
b
```

```python
for v in h1.values():
    print(v)
```

Salida
```
1
3
2
```
