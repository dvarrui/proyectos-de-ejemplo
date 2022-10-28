[<< back](README.md)

# ¿De dónde venimos?

_Una de las grandes preguntas_

En POO los objetos se crean a partir del constructor de la clase. Un constructor es un método encargado de crear nuevas instancias de la clase.

## Contructor: ¿estilo llamada a función o estilo invocación de método?

En Python se usa `Person("Darth Vader")` para invocar al constructor. No está visible pero internamente se construye un nuevo objeto `Person` y se invoca al método `__init__` de la instancia para inicializar sus valores.

```python
class Person:
  def __init(self, name):
    self.name = name


vader = Person("Darth Vader")
```

En Ruby tenemos que las clases tiene el método `new` que usamos construir nuevas instancias.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

obiwan = Person.new("Obi-wan Kenobi")
```

Invocar al constructor sin usar new no funcionará. Por ejemplo `yoda = Person("Maestro Yoda")` devuelve `Undefined error`. Aunque, hace poco descubrí que _hay algunas clases de Ruby_ donde podemos usar un constructor como función:

```ruby
>> Integer(1.6)
=> 1
>> Float(16)
=> 16.0
>> String("why?")
=> "why?"
>>
```

Esto lo descubrí por casualidad. Realmente esto tipos de datos, aunque son objetos, normalmente los creamos en modo _syntax sugar_ (Aquí tengo que seguir indagando)

```ruby
a = 6
b = 1.6
c = "why?"
```

## Clases en mayúsculas o minúsculas

En Ruby las clases se crean siempre empezando con mayúscula. En caso constrario hay un `Syntax Error`. En cambio en Python podemos crear las clases en mayúsculas o minúsculas.

Me surge la duda: ¿Por qué las clases `type`, `str`, `int` son minúsculas cuando los tutoriales recomiendan `PascalCase`?

¿Será mantener la "sensación" de que estamos invocando a una función aunque no sea cierto? El estilo de función de un constructor-función se refuerza al usar nombres de clase en minúscula.

## Vestigios del pasado

Será ¿porque en versiones anteriores de Python existían esas funciones y al crear las clases/objetos se decidió mantenerlos en minúscula para que pareciera que nada había cambiado?

El hecho de que hayan llamado a la clase padre `type` me hace pensar que es así. De modo que cuando se muestra la clase de un objeto en Python aparece `<type 'str'>` como queriendo decir que el objeto es de "tipo string".

Antes vimos que en Ruby no se suele usar constructor-función, y aunque los nombres de función/método se suelen escribir en minúsculas, es posible crear una función/método Ruby que simule ser un contructor-función. Pero vamos, que no se usa de esta forma... aunque quiero averiguar... ¿por qué existe esa posibilidad aunque no se usa? ¿Vestigios del pasado Ruby?

```ruby
>> self
=> main
>> self.methods.sort.select { _1.to_s.start_with? 'int'}    # ruby
[]
>> self.methods.sort.select { _1.to_s.start_with? 'Int'}    # ruby
[]
>> self.respond_to? Integer    # ruby
eval error: Integer is not a symbol nor a string

>> self.respond_to? :Integer    # ruby
false
>> self.respond_to? :integer    # ruby
false
```

No encuentro que `Integer()` sea un método de la clase `main`. Pero leyendo en foros de Ruby y leyendo el código fuente en GitHub (https://github.com/ruby/ruby) da la sensación que las clases Integer, Float, String (y alguna más) están definidas en el C del propio intérprete Ruby. Son especiales en este sentido. El resto de clases/tipos de objetos se definen usando el propio lenguaje Ruby.

Entonces en Ruby el contructor es invocar al new de la clase, pero estas clases especiales están predefinidas en el propio intérprete (Por lo menos es así en CRuby/MRI).

## ¿Qué imagen queremos dar?

Da la sensación que en Python se pretende "ocultar" la POO en la forma de consultar la clase/tipo de una variable y que parezca una función.

En Ruby parece que pretender mostrar un aspecto POO y métodos para todo. Ocultando que hay clases particulares con un constructor-función.
