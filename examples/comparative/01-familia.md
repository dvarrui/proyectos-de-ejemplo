[<< back](README.md)

# La familia

_Hay un dicho que dice "La familia es lo primero". Y otro que dice que tenemos 2 familias: la que nos viene de nacimiento y la otra que la elegimos nosotros._ En cualquier caso, los miembros de una misma familia tienen rasgos parecidos.

Algo parecido pasa con Python y con Ruby. Tienen rasgos parecidos.
* Son lenguajes interpretados.
* Dinámicos.
* Con el objetivo de favorecer la productividad del humano antes que la máquina.
* Son libres, multiplataforma, etc.

En una ocasión tuve la oportunidad de hablar de ello en un PyBirras de 2019: ["Ruby y Python..., ¿primos hermanos o primos lejanos?"](https://www.youtube.com/watch?v=NsTRdcHPYqk).

## Ejemplo Python3

Vamos a ver un ejemplo de cómo resolver una ecuación de segundo grado en Python:

```python
# Resolver ecuación de 2do grado
a = 2
b = -14
c = 24

raiz = (b**2 - 4*a*c)**0.5

x1 = (-b - raiz) / (2*a)
x2 = (-b + raiz) / (2*a)

print(x1)
print(x2)
```

Ejecutamo el programa Python:

```bash
❯ python3 files/011-resolver_ecuacion.py
3.0
4.0
```

Tenemos las dos soluciones de la ecuación de 2do grado. Ahora vamos a ejecutar **el mismo** código con el intérprete de Ruby.

```bash
❯ ruby files/011-resolver_ecuacion.py
3.04.0%   
```

Ok. No hay mensajes de error. Tenemos una salida... pero es "rara". Esto es "3.04.0%".

El tema es que la función `print()` de Ruby no añade retorno de carro y la de Python si lo hace. Si hubiera escogido un ejemplo de algoritmo secuencial para la resolución de un problema matemático con una única salida por pantalla.... Seguro que no notábamos la diferencia.

Hagamos un pequeño cambio al código de Python3.

```
print(x1, "\n")
print(x2, "\n")
```

Y volvemos a ejecutar "el mismo código" con Python3 y Ruby.

```
❯ python3 files/012-resolver_ecuacion.py
3.0

4.0

❯ ruby files/012-resolver_ecuacion.py
3.0
4.0
```

**El mismo código funciona en Python3 y en Ruby**

## Ejemplo Ruby

Ahora vamos a reescribir el programa siguiendo el estilo de un programador Ruby.

```Ruby
# Resolver ecuación de 2do grado
a = 2
b = -14
c = 24

raiz = (b**2 - 4*a*c)**0.5

x1 = (-b - raiz) / (2*a)
x2 = (-b + raiz) / (2*a)

puts x1
puts x2
```

Tampoco cambia mucho. En lugar de `print` se usa `puts`, y los paréntesis para los argumentos son opcionales. Ejecutamos para probarlo:

```
❯ ruby files/013-resolver_ecuacion.rb
3.0
4.0

❯ python3 files/013-resolver_ecuacion.rb
  File "./files/013-resolver_ecuacion.rb", line 11
    puts x1
         ^^
SyntaxError: invalid syntax
```

Python3 no entiende `puts` y es un error de sintaxis.

## Versiones

Explícitamente se ha indicado que la ejecución del código se ha hecho con Python3 para no confundirlo con Python2, puesto que la salida no sería idéntica.

En el caso de Ruby no se indica, porque todas las versiones de Ruby dan la misma salida.
