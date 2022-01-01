
[<< back](15-iteradores.md)|[next>>](20-estrategia-poo.md)

# I Love Ruby

![](./images/iloveruby.png)

---

# Metaprogramación

`Programas que escriben programas`... pero... con matices.

Enlaces de interés:
* https://www.leighhalliday.com/ruby-metaprogramming-creating-methods

## Wikipedia: Metaprogramación

La metaprogramación consiste en escribir programas que escriben o manipulan otros programas (o a sí mismos) como datos, o que hacen en tiempo de compilación parte del trabajo que, de otra forma, se haría en tiempo de ejecución. Esto permite al programador ahorrar tiempo en la producción de código.

Un ejemplo sencillo de un metaprograma sería este script de Bash:

```
#!/bin/bash
# metaprogram
echo '#!/bin/bash' >program
for ((I=1; I<=992; I++)); do
   echo "echo $I" >>program
done
chmod +x program
```

---

# Reflexión

```
$ irb

irb(main):001:0> a=[1,2,3]
=> [1, 2, 3]

irb(main):002:0> a.class
=> Array

irb(main):003:0> a.methods
...
```

---

## METAGROGRAMACIÓN con mayúsculas

Ejemplo 1:
```
#!/usr/bin/env ruby

class Person
  def initialize(name)
    @name = name
  end
end

quigon = Person.new("Qui-gon Jinn")

puts '='*60
puts "Object             : #{quigon}"
puts "Instance variables : #{quigon.instance_variables}"
puts "Method with name   : #{quigon.public_methods.grep(/name/)}"
puts "Object#name        : undefined method 'name'"
puts '='*60
```

Salida1:
```
============================================================
Object             : #<Person:0x000055a3351d8070>
Instance variables : [:@name]
Method with name   : []
Object#name        : undefined method 'name'
============================================================
```

---

Ejemplo2:
```
#!/usr/bin/env ruby

class Person
  def getter(var)
    define_singleton_method(var) do
      instance_variable_get("@#{var}")
    end
  end

  def initialize(name)
    @name = name
    getter('name')
  end
end

quigon = Person.new("Qui-gon Jinn")

puts '='*60
puts "Object             : #{quigon}"
puts "Instance variables : #{quigon.instance_variables}"
puts "Method with name   : #{quigon.public_methods.grep(/name/)}"
puts "Object#name        : #{quigon.name}"
puts '='*60
```

Salida2:
```
============================================================
Object             : #<Person:0x00005557563ee308>
Instance variables : [:@name]
Method with name   : [:name]
Object#name        : Qui-gon Jinn
============================================================
```

---

Ejemplo3:
```
#!/usr/bin/env ruby

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

quigon = Person.new("Qui-gon Jinn")

puts '='*60
puts "Object             : #{quigon}"
puts "Instance variables : #{quigon.instance_variables}"
puts "Method with name   : #{quigon.public_methods.grep(/name/)}"
puts "Object#name        : #{quigon.name}"
puts '='*60
```

Salida3:
```
============================================================
Object             : #<Person:0x0000563e5acb9370>
Instance variables : [:@name]
Method with name   : [:name, :name=]
Object#name        : Qui-gon Jinn
============================================================
```

[<< back](14-bloques.md)|[next>>](16-metaprogramacion.md)
