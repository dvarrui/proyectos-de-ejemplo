[<< back](README.md)

# ¿Self o no self? Esa es la cuestión.

Del documento anterior sacamos la siguiente tabla resumen:

| Lenguaje | Tipado   | Self      |
| -------- | -------- | --------- |
| Java     | Estático |           |
| Python   | Dinámico | Requerido |
| Ruby     | Dinámico |           |
| Rust     | Estático | Requerido |

Resulta que Rust y Python requieren del uso del parámetro `self` en la definición de los métodos de instancia. Sin embargo Java y Ruby no lo necesitan...

_¿Por qué unos sí y otros no? ¿Es una requisito de la implementación (intérprete/compilador) o es una elección del lenguaje?_

Creamos una clase `Person` en Python y definimos dos atributos `name` y `self.rol`. Se comprueba que las instancias `yoda` y `vader` toman los valores por defecto de dichos atributos.

```python
>>> class Person:
...   rol = "jedi"
...   def __init__(self, name):
...     self.name = name
...
>>> yoda = Person("yoda")
>>> yoda.rol
'jedi'
>>> yoda.name
'yoda'
>>> vader = Person("vader")
>>> vader.rol
'jedi'
>>> vader.name
'vader'
```

_¿Es posible que `rol` sea atributo de clase (compartido entre todas las instancias) y `name` atributo de instancia (no compartido entre instancias)?_ Probemos:

```python
>>> Person.rol
'jedi'
>>> vader.rol = "sith"
>>> vader.name = "Darth Vader"
>>> vader.rol
'sith'
>>> vader.name
'Darth Vader'
>>> yoda.rol
'jedi`
>>> yoda.name
'yoda'
```

_¡Parece que no!_. Simplemente son dos formas de crear variables de instancia.

Por lo visto, ambos son atributos de instancia. Entonces _¿por qué es necesario el citado `self`?_

**IMHO.1** Da la impresión de ser un requisito de la implementación del lenguaje. Un requierimiento del intérprete. Pero en tal caso ¿por qué un tema de implementación del intérprete se traslada al programador? _¿Tiene sentido en un lenguaje de alto nivel trasladar al programador detalles de implementación del intérprete/compilador?_

**IMHO.2** En Ruby se usa `self`, en Java `this` y en Python y Rust se puede usar la palabra que se quiera. Con este mecanismo se da la oportunidad al programador de elegir que palabra clave quiere usar para que el objeto pueda autoreferenciarse a sí mismo _Me parece contradictorio que eso tenga lugar en Python puesto que en su filosofía está la de buscar un camino preferente y no la filosofía de ofrecer un amplio abanico de caminos para solucionar el mismo problema._

**IMHO.3** Me pongo a pensar. Si Rust y Python coinciden en esta forma de definir las entidades clases... ¿será que la forma de implementar de ambos lenguajes es similar? En tal caso. Como Rust realmente no tiene clases. Son structs+impl. ¿Será que Python realmente lo implementa por debajo parecido a Rust? _... ¿Cómo lo averiguarmos?_

# Ejemplo Ruby

Vamos a probar lo mismo en Ruby

```ruby
class Person
  @rol = "jedi"

  def initialize(name)
    @name = name
  end

  def rol=(rol)
    @rol = rol
  end

  def to_s
    "name=#{@name}, rol=#{@rol}"
  end
end

yoda = Person.new("yoda")
puts "yoda  => #{yoda}"
vader = Person.new("vader")
puts "vader => #{vader}"

vader.rol="sith"
puts "vader => #{vader}"
puts "yoda  => #{yoda}"
```

Se obtiene siguiente salida:
```
❯ ./examples/101-instance_var.rb
yoda  => name=yoda, rol=
vader => name=vader, rol=
vader => name=vader, rol=sith
yoda  => name=yoda, rol=
```

* `name` es un atributo de la instancia `yoda`
* `rol` no es un atributo de la instancia porque no se define dentro del constructor. Realmente se define a nivel de la clase Person. Pero no es un atributo al que puedan acceder las instancias. Solamente `vader` toma el valor de `@rol` igual a `sith`, pero porque invocamos al método `rol=()` que inicializó la variable `@rol` que estaba sin definir.

> Se que esto puede confundir a un no rubydev, pero Person es la clase de la instancia yoda, y @rol está definido como atributo de instancia del objeto Person. ¡Si! Las clases son objetos en Ruby. ¡Todo es un objeto!. Person es una instancia de la clase Class. Y Class es una instancia de las clase Class. Y ya paremos. Es como el type de Python.

Para crear un atributo de clase (Esto es, un atributo al que acceden todas las instancias), basta con cambiar `@rol` por `@@rol`.

```ruby
#!/usr/bin/env ruby

class Person
  @@rol = "jedi"

  def initialize(name)
    @name = name
  end

  def rol=(rol)
    @@rol = rol
  end

  def to_s
    "name=#{@name}, rol=#{@@rol}"
  end
end

yoda = Person.new("yoda")
puts "yoda  => #{yoda}"
vader = Person.new("vader")
puts "vader => #{vader}"

vader.rol="sith"
puts "vader => #{vader}"
puts "yoda  => #{yoda}"
```

Tenemos la siguiente salida:

```
❯ ./examples/102-class_var.rb
yoda  => name=yoda, rol=jedi
vader => name=vader, rol=jedi
vader => name=vader, rol=sith
yoda  => name=yoda, rol=sith
```
