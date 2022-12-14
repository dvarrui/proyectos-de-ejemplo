[<<back](README.md)

# Scope o ámbito

_El "scope" o ámbito es el "espacio/tiempo" del código donde viven las variables que definimos._

Las variables se definen dentro de un ámbito (scope) y "sólo existen o sólo son válidas" dentro de dicho ámbito.

## 1. Acceso de fuera hacia adentro

Veamos un ejemplo con Ruby:

```ruby
def greet
   name = "Obiwan"
   puts "Hello! I'm #{name}"
 end

greet # => Obiwan

# Sin embargo, tratar de usar la variable name fuera de la función es un error.
puts name
```

Obtenemos el siguiente error:

```
Hello! I'm Obiwan
./01-greet.rb:11:in `<main>': undefined local variable or method `name' for main:Object (NameError)

puts name
    ^^^^
```

Por tanto, tenemos que el "scope" de la variable `name` es la función `greet`.

Veamos un ejemplo con Python:

```python
def greet():
  name = "Obiwan"
  print("Hello! I'm ", name)

greet() # => Obiwan

# Sin embargo, tratar de usar la variable name fuera de la función es un error.
print(name)
```

Obtenemos el siguiente error:

```
Hello! I'm Obiwan
Traceback (most recent call last):
File ".../02-greet.py", line 10, in <module>
  print(name)
NameError: name 'name' is not defined
```

Conclusión:
* Python y Ruby se comportan igual.
* Una variable definida dentro de una función no es accesible desde fuera.

## 2. Acceso de dentro hacia afuera

En el siguiente ejemplo definimos la variable fuera del ámbito de la función y luego intentamos usarla dentro de la función:

```ruby
name = "Darth Vader"
puts name

def greet
  puts "Hello! I'm #{name}"
 end

greet # Esto es un error de ámbito
```

Obtenemos el siguiente error:

```
./03-greet.rb:6:in `greet': undefined local variable or method `name' for main:Object (NameError)

  puts "Hello! I'm #{name}"
                     ^^^^
	from ./03-greet.rb:9:in `<main>'
```

**Explicación**: El problema es que la variable `name` está definida en un ámbito (`main`) y el método `greet` tiene otro ámbito diferente donde dicha variable no está definida.

Veamos el mismo ejemplo con Python:

```python
name = "Darth Vader"
print(name)

def greet():
  print("Hello! I'm ", name)

greet() # Esto funciona
```

Obtenemos la salida siguiente:
```
Darth Vader
Hello! I'm Darth Vader
```

_¿Eh? ¡Esto no falla! ¿Por qué?_

**Explicación**:
* En Python cuando se define una variable en el "scope principal" _funciona como una variable global_ pero no es estrictamente una variable global porque las variables globales son accesibles desde todos los ámbitos. En Python las variables definidas en un "scope A" son accesibles desde cualquier "scopes B" si B es interno a A. Definir una variable en un "scope principal" implica que todos sus "scopes secundarios o internos" tendrán acceso.
* En Ruby se pueden definir variables global en cualquier scope. Para ello habría que escribir `$name = "Darth Vader"`. Las variables globales en Ruby se nombran empezando por el carácter `$` (Esto ayuda a su identificación).

```ruby
$name = "Yoda"
puts $name

def greet
  puts "Hello! I'm #{$name}"
  $rol = "Jedi master"
 end

greet
puts "I'm a #{$rol}"
```

Salida:

```
Yoda
Hello! I'm Yoda
I'm a Jedi master
```

Conclusión:
* En Python las variables definidas en el "scope principal" funcionan como una especia de "variables globales" para los scopes de nivel inferior.
* En Ruby las variables definidas en un "scope" sea principal a no, son variables internas de dicho ámbito. Las variables globales son diferentes de las variables normales.

## El ámbito dentro de las clases

Veamos un ejemplo con Ruby:

```ruby
```
