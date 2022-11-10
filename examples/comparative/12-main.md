[<< back](README.md)

# Main: principal, importante

_¡Divide y Vencerás!_

Nada más empezar en la carrera te lo dicen. Cuando encontremos un problema complejo, lo mejor es dividirlo en varios problemas menores, y así sucesivamente hasta que nos queden problemas que podamos resolver con poca dificultad.

Al programar, escribimos nuestro código en un fichero de texto plano, pero si el programa es muy grande o tiene diferentes partes, es mejor reorganizar el código en diferentes ficheros.

## 1. Separar responsabilidades

Veamos un ejemplos con varios ficheros:
* El fichero "operations" contiene la biblioteca de funciones.
* El fichero "calcule" hace uso de la biblioteca "operations"
* Python usa `import` y Ruby `require_relative`.

**Ejemplo Python**

```python
# File: operations.py
def sum(a, b):
  return a + b

def mul(a, b):
  return a * b
```

```python
# File: calcule.py
from operations import *

print(sum(-2, 3)) # => 1
print(mul(-2, 3)) # => -6
```

**Ejemplo Ruby**

```ruby
# File: operations.rb
def sum(a, b)
  a + b
end

def mul(a, b)
  a * b
end
```

```ruby
# File: calcule.rb
require_relative "operations"

puts sum(-2, 3) # => 1
puts mul(-2, 3) # => -6
```

La ventaja de organizar el código en varios ficheros es la de separar responsabilidades. Uno es biblioteca y el otro consume los servicios de la biblioteca. Distintas funciones en ficheros separados.

## 2. Todo en un fichero (sin main)

El código del ejemplo es tan simple que podríamos dejarlo todo en un único fichero.

**Ejemplo Python**
```python
def sum(a, b):
  return a + b

def mul(a, b):
  return a * b

print(sum(-2, 3))
print(mul(-2, 3))
```

**Ejemplo Ruby**
```ruby
def sum(a, b)
  a + b
end

def mul(a, b)
  a * b
end

puts sum(-2, 3)
puts mul(-2, 3)
```

# 3. Todo en un fichero (con main)

Los ejemplos anteriores tienen todo el código en un único fichero (tanto biblioteca de funciones como sus invocaciones). Estos ficheros se pueden ejecutar pero NO sirven como ficheros de biblioteca (módulos, etc.).

Vamos cambiar el código del fichero para que sirva tanto como biblioteca como consumidor o invocador de funciones.

**Ejemplo Python**

```python
def sum(a, b):
  return a + b

def mul(a, b):
  return a * b


if __name__ == '__main__':
  print(sum(-2, 3))
  print(mul(-2, 3))
```


**Ejemplo Ruby**

```Ruby
def sum(a, b)
  a + b
end

def mul(a, b)
  a * b
end

if __FILE__ == $0
  puts sum(-2, 3)
  puts mul(-2, 3)
end
```

> Esto me recuerda al método de Java `public static void main()` que tienen algunos ficheros para poder funcionar como invocadores en lugar de bibliotecas.

## 4. Resumen

Supongamos un proyecto con ficheros biblioteca e invocadores separados. Entonces:
* En Python, aunque los ficheros invocadores nunca se vayan a usar como biblioteca en una sentencia `import`, parece que predomina el estilo 3.
* En Ruby no se usa el estilo 3 en los proyectos.
