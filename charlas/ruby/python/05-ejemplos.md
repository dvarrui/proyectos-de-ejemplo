
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

p = Persona.new "David"
puts p
```
