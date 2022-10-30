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

Ejecutamo el programa Python3:

```bash
❯ python3 files/051-resolver_ecuacion.py
3.0
4.0
```

Tenemos las dos soluciones de la ecuación de 2do grado. Ahora vamos a ejecutar **el mismo código** con el intérprete de Ruby.

```bash
❯ ruby files/051-resolver_ecuacion.py
3.04.0%   
```

Se ejecuta sin emitir mensajes de error. Por tanto ha entendido la sintaxis.
Tenemos una salida... pero es "rara". Esto es "3.04.0%".

El tema es que la función `print()` de Ruby no añade retorno de carro y la de Python si lo hace. Si hubiéramos escogido un ejemplo de algoritmo secuencial para la resolución de un problema matemático con una única salida por pantalla.... ¡Seguro que no notábamos la diferencia!.

## Un pequeño truco

Hagamos un pequeño cambio al código de Python3 para ser "solidarios" con el intérprete de Ruby.

```
print(x1, "\n")
print(x2, "\n")
```

Y volvemos a ejecutar "el mismo código" con Python3 y Ruby.

```
❯ python3 files/052-resolver_ecuacion.py
3.0

4.0

❯ ruby files/052-resolver_ecuacion.py
3.0
4.0
```

Podemos decir que **¡El mismo código funciona en Python3 y en Ruby!**

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

Tampoco cambia mucho. En lugar de `print` se usa habitualmente `puts`, y los paréntesis para los argumentos son opcionales. Ejecutamos para probarlo:

```
❯ ruby files/053-resolver_ecuacion.rb
3.0
4.0

❯ python3 files/053-resolver_ecuacion.rb
  File "./files/053-resolver_ecuacion.rb", line 11
    puts x1
         ^^
SyntaxError: invalid syntax
```

> En Python2 se puede escribir `print x1` sin usar paréntesis. Al estilo Ruby.

Python3 no entiende `puts` y es un error de sintaxis.

## Versiones

Explícitamente se ha indicado que la ejecución del código se ha hecho con Python3 para no confundirlo con Python2, puesto que la salida de este ejemplo no sería idéntica.

En el caso de Ruby no se indica, porque todas las versiones de Ruby dan la misma salida.

A continuación mostramos una tabla con los cambios realizados en el lenguaje Python, extraída del libro "_Learning Python_" de Mark Lutz (No aparecen nuevas funcionalidades sólo los cambios):

| ID | Removed                 | Replacement |
| -- | ----------------------- | ----------- |
| 01 | 9999L                   | 9999 |
| 02 | anydbm module           | dbm (renamed) |
| 03 | apply(f, ps, ks)        | f(*ps, \**ks) |
| 04 | \_\_builtin\_\_         | builtins (renamed) |
| 05 | 'bbb' for byte strings  | b'bbb' |
| 06 | class MyException:      | class MyException(Exception): |
| 07 | cmp(x, y)               | (x > y) - (x < y) |
| 08 | cPickle module          | _pickle (renamed, used automatically) |
| 09 | Dictionary <, >, <=, >= | Compare sorted(D.items()) (or loop code) |
| 10 | D.has_key(K)            | K in D (or D.get(key) != None) |
| 11 | D.keys(), etc. as lists | list(D.keys()) (dictionary views) |
| 12 | def f((a, b)):          | def f(x): (a, b) = x |
| 13 | execfile(filename)      | exec(open(filename).read()) |
| 14 | exec open(filename)     | exec(open(filename).read()) |
| 15 | except E, X:            | except E as X: |
| 16 | exceptions module       | Built-in scope, library manual |
| 17 | file.xreadlines         | for line in file: (or X=iter(file)) |
| 18 | file                    | open (and io module classes) |
| 19 | function.func_code      | function.\_\_code\_\_ |
| 20 | from ... *, within a function | May only appear at the top level of a file |
| 21 | \_\_getattr\_\_ run by built-ins | Redefine \_\_X\_\_ methods in wrapper classes |
| 22 | import mod, in same package   | from . import mod, package-relative form
| 23 | long                    | int |
| 24 | old input               | eval(input()) |
| 25 | os.popen2/3/4           | subprocess.Popen (os.popen retained) |
| 26 | \_\_metaclass\_\_ = M       | class C(metaclass=M): |
| 27 | Mixed type comparisons, sorts | Nonnumeric mixed type comparisons are errors |
| 28 | map(), range(), etc. as lists | list(map()), list(range()) (built-ins) |
| 29 | map(None, ...)          | zip (or manual code to pad results) |
| 30 | print x, y              | print(x, y) |
| 31 | print >> F, x, y        | print(x, y, file=F) |
| 32 | print x, y              | print(x, y, end=' ') |
| 33 | raise E, V              | raise E(V) |
| 34 | raw_input               |input |
| 35 | reduce                  | functools.reduce (or loop code) |
| 36 | reload(M)               | imp.reload(M) (or exec)|
| 37 | Sort comparison functions | Use key=transform or reverse=True |
| 38 | String-based exceptions | Class-based exceptions (also required in 2.6) |
| 39 | String module functions | String object methods |
| 40 | sys.exc_type, exc_value | sys.exc_info()[0], [1] |
| 41 | -t, –tt command-line switches | Inconsistent tabs/spaces use is always an error |
| 42 | thread, Queue modules   | _thread, queue (both renamed) |
| 43 | Tkinter                 | tkinter (renamed) |
| 44 | types.List              | Typelist (types is for nonbuilt-in names only) |
| 45 | Unbound methods         | Functions (staticmethod to call via instance) |
| 46 | u'ccc'                  | 'ccc' |
| 47 | \`X\`                   | repr(X) |
| 48 | X <> Y                  | X != Y  |
| 49 | xrange                  | range |
| 50 | X.next                  | X.\_\_next\_\_, called by next(X) |
| 51 | X.\_\_getslice\_\_      | X.\_\_getitem\_\_ passed a slice object |
| 52 | X.\_\_setslice\_\_      | X.\_\_setitem\_\_ passed a slice object |
| 53 | X=D.keys(); X.sort()    | sorted(D) (or list(D.keys())) |
| 54 | X.\_\_cmp\_\_(y)        | \_\_lt\_\_, \_\_gt\_\_, \_\_eq\_\_, etc. |
| 55 | X.\_\_nonzero\_\_           | X.\_\_bool\_\_ |
| 56 | X.\_\_hex\_\_, X.\_\_oct\_\_    | X.\_\_index\_\_ |
