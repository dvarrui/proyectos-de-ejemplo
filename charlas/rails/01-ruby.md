
# Elementos básicos de Ruby

```
irb> a = "Hello!"
=> "Hello!"
irb> a.class
=> String

irb> b = 16
=> 16
irb> b.class
=> Integer

irb> a ="Obiwan Yoda Vader"
=> "Obiwan Yoda Vader"
irb> c = a.split(" ")
=> ["Obiwan", "Yoda", "Vader"]
irb> c.class
=> Array

irb> d = { jedi: 'Obiwan', sith: 'Vader' }
=> {:jedi=>"Obiwan", :sith=>"Vader"}
irb> d.class
=> Hash
irb> d[:sith]
=> "Vader"
```

```
def saludar(nombre)
  puts "Hola #{nombre}!"
end

saludar "Anakin"   # => Hola Anakin!
```


```
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    puts "Hello! I'm #{@name}"
  end
end

p = Person.new("Obiwan",49)
p.class                      # => Person
p.greet                      # => Hello! I'm Obiwan
```
