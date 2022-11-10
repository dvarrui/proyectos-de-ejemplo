[<< back](README.md)

# Objetos

En Java todo son objetos, en Python todo son objetos, en Ruby todo son objetos. ¿Todo son objetos para todos? Pero ¿todos definen "todo" igual?

_Igual no es todo, todo lo que parece. ;-)_

## ¿Las funciones son objetos?

En Ruby, las funciones son objetos (Lambdas o Procs):

```ruby
sum = ->(a, b) { a + b }

puts sum.class
puts sum.call(3,4)

sum = lambda{ |a, b| a + b }

puts sum.class
puts sum.call(3,4)
```

Salida

```
Proc
7
Proc
7
```

## ¿Los métodos son objetos?

En Ruby, los métodos son objetos:

```ruby
def sum(a, b)
  return a + b
end

m = method :sum

puts m.class
puts m.call(3,4)
```

Salida

```
Method
7
```

## ¿Las clases son objetos?

Y además, en Ruby las clases... son objetos.

```ruby
class Person
end

class Jedi < Person
end

puts "==> Jedi class:"
puts Jedi
puts Jedi.class
puts Jedi.superclass

puts "==> Person class:"
puts Person
puts Person.class
puts Person.superclass
```

La salida es:

```
==> Jedi class:
Jedi
Class
Person
==> Person class:
Person
Class
Object
```

Traducimos lo que ha pasado.
* La clase `Jedi` es una instancia de la clase `Class` y hereda de la clase `Person`.
* La clase `Person` es una instancia de la clase `Class` y hereda de la clase `Object`.

Si las clases, son instancias de Class... ¿pueden tener atributos de instancia? ¡Sí!

```ruby
class Person
  @rol = "jedi"

  def initialize(name)
    @name = name
  end

  def to_s
    "name=#{@name}, rol=#{@rol}"
  end
end

yoda = Person.new("yoda")
vader = Person.new("vader")

puts "yoda  : #{yoda}"
puts "vader : #{vader}"

# Se obtiene siguiente salida:
# => yoda  : name=yoda, rol=
# => vader : name=vader, rol=
```

`@rol` no es un atributo de las instancias de la clase Person.

Se que esto puede confundir a un no "rubydev", pero Person es la clase de la instancia `yoda`, y `@rol` está definido como atributo de instancia `Person`. ¡Si! **Las clases son objetos en Ruby**. ¡Todo es un objeto!.

`Person` es una instancia de la clase `Class`. Y `Class` es una instancia de las clase `Class`. ¡Y ya paramos!. Es como el type de Python que su type es type. ¡Y ya paramos!

```ruby
>> yoda = Person.new("yoda")
=> #<Person:0x00007fb08dec5190>
>> yoda.class
=> Person

>> Person.class
=> Class

>> Class.class
=> Class
>>

>> yoda.instance_variables
=> [:@name]

>> Person.instance_variables
=> [:@rol]
```
