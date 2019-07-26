
# Diferencias: Ejemplos

## Clases/objetos

Python:
```
class Persona:
    def __init__(self, nombre):
        self.nombre = nombre

    def __str__(self):
        return "Nombre: %s" % (self.nombre)

p = Persona("Sergio")
print p
```

Ruby:
```
class Persona
  def initialize(nombre)
    @nombre = nombre
  end

  def to_s
    "Nombre : #{@nombre}"
  end
end

p = Persona.new("David")
puts p
```

---

## TODO son objetos

```
$ irb

3 + 4   => 7
3.+(4)  => 7
3.class => Integer

3.to_s  => "3"
3.to_f  => 3.0
```

---

## Varios caminos

```
a = [1,3,5,7] => [1, 3, 5, 7]
a.size        => 4
a.length      => 4
a.count       => 4
```

---

## Bloques de código

Varias formas de crear los bloques de código
```
c = Proc.new { |x| puts x }
c = proc { |x| puts x }
c = lambda { |x| puts x }

c.call "Hello world!"
```

Los interadores están integrados en cada clase usando los bloques de código:
```
[1,3,5,7].each do |i|
  puts i
end

c = Proc.new { |i| puts i}
[1,3,5,7].each(&c)
```
