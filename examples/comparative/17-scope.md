[<<back](README.md)

# Scope o ámbito

_El "scope" o ámbito es el "espacio/tiempo" del código donde viven las variables que definimos._

Las variables se definen dentro de un ámbito (scope) y "sólo existen o sólo son válidas" dentro de dicho ámbito.

Veamos un ejemplo con Ruby:

```ruby
def greet
   name = "Obiwan"
   puts "Hello! I'm #{name}"
 end

greet # => Obiwan

# Sin embargo, tratar de usar la variable name fuera de la función es un error.
puts name

# => Hello! I'm Obiwan
# => ./01-greet.rb:11:in `<main>': undefined local variable or method `name' for main:Object (NameError)
#
# => puts name
# =>      ^^^^
```

Por tanto, tenemos que el "scope" de la variable `name` es la función `greet`.

Veamos un ejemplo con Python
