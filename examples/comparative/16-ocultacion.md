[<< back](README.md)

# ¿Me ves ahora?: "Ocultación"

> Enlaces de interés:
> * https://interactivechaos.com/es/manual/tutorial-de-python/ocultando-atributos-y-metodos-ii

## Python

En Python3 la forma de ocultar atributos y/o métodos es usar nombres que comiencen por doble guion bajo. Veamos un ejemplo:

```python
class Person:
  __rol = 'jedi'

  def __init__(self, name):
    self.name = name

  def hello1(self):
    print("Hello1:", self.name)

  def hello2(self):
    self.__hello3()

  def __hello3(self):
    print("Hello3:", self.name, "(", Person.__rol, ")")

yoda = Person("Yoda")
yoda.hello1()
yoda.hello2()

# => Hello1: Yoda
# => Hello3: Yoda ( jedi )
```

Hasta aquí, todo normal. Pero resulta que si podemos invocar a los métodos ocultos y acceder a los atributos ocultos. Sólo hay que descubrir cómo se llaman. Si ejecutamos `print(str(dir(yoda)))`, se nos muestra por pantalla un listado de nombres de métodos, como `['_Person__hello3', '_Person__rol', ...]`. Si los invocamos tenemos lo siguiente:

```python
yoda._Person__hello3()
print(yoda._Person__rol)

# => Hello3: Yoda ( jedi )
# => jedi
```

|         | Atributo | Método    |
| ------- | -------- | --------- |
| Oculto  | __rol    | __speak() |
| Visible | name     | hello()   |

**¿El motivo?**

* He leído decir lo siguiente: _"Fue construido así para poder hacer pruebas unitarias de los métodos privados de la clase"_. OK. Lo entiendo, pero leyendo a "Uncle Bob" (Experto en TDD) _"No se hacen pruebas unitarias de los métodos privados porque no queremos que el código de los tests esté acoplado a la implementación de la clase"._ Entonces, debe ser otra la causa.
* Otros dicen que _"los nombres que comienzan por doble guion se usa para garantizar que las subclases no anulen accidentalmente los métodos y atributos privados de sus superclases. No está diseñado para evitar el acceso deliberado desde el exterior."_. Mmm

## Ruby

Ruby es un lenguaje dinámico y permite cambiarse a sí mismo en tiempo de ejecución. De modo que presiento que aunque se definan reglas casi seguro habrán mecanismos para deshacerlas. ¡Bueno probemos!

```ruby
class Person
  @@rol = "jedi"

  def initialize(name)
    @name = name
  end

  def hello1
    puts "Hello1:" + @name
  end

  def hello2
    hello3
  end

  private

  def hello3
    puts "Hello3: #{@name} (#{@@rol})"
  end
end

obiwan = Person.new("Obiwan")
obiwam.hello1
obiwan.hello2

# => Hello1: Obiwan
# => Hello3: Obiwan (jedi)
```

* En Ruby los atributos (`@name`) son privados siempre. Si queremos acceder desde fuera de la clase hay que crearse métodos "getter/setter". Se suele hacer con `attr_accessor :name`.
* En Ruby Los métodos son públicos por defecto y para hacer un método privado hay que indicarlo con `private`.

Entremos en `irb` para hacer algunas pruebas:

```ruby
>> require_relative "person"

>> obiwan = Person.new("Obiwan")
=> #<Person:0x00007f399945c160 @name="Obiwan">

>> obiwan.private_methods
=>
[:initialize,                                                                 
 :hello3,                                                                     
 :DelegateClass,                                                              
...]
```

Podemos ver que usando reflexión descubrimos los métodos privados de la clase. Además, como la POO de Ruby funciona como paso de mensajes, podemos enviar un mensaje al objeto para que invoque el método privado.

```ruby
>> obiwan.send(:hello3)
Hello3:Obiwan
Hello3:jedi
```

Según esto, hay "ocultación", pero nos la podemos saltar (como casi todas las reglas de Ruby). Entonces se consigue un resultado/efecto parecido al logrado con Python.

_¿Y con los atributos privados "ocultos" podemos hacer algo más?_

```ruby
>> obiwan.instance_variables
=> [:@name]
>> obiwan.instance_variable_get(:@name)
=> "Obiwan"

>> obiwan.instance_variable_set(:@name, "Kenobi")
=> "Kenobi"
>> obiwan.hello1
Hello1: Kenobi
```

Pues resulta que podemos:
* Saber las variables de instancia del objeto.
* Leer sus valores directamente
* Y modificar sus valores desde fuera del objeto.

## Conclusión

* En Python podemos acceder a los atributos ocultos e invocar métodos ocultos. No es un error, es una decisión de diseño.
* En Ruby también podemos acceder a los atributos oculto e invocar métodos privado. No es un error, es una decisión de diseño.

_¡Interesante! Pero ¿cuál es el motivo?_
