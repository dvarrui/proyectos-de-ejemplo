[<< back](README.md)

# ¿Qué soy?

_¿Cómo averiguar el tipo/clase de un objeto?_

> Enlace de interés:
> * https://stackoverflow.com/questions/48066220/python-class

Una cadena de texto o string es un tipo de dato, y tanto en Python como en Ruby los strings son objetos. En Ruby, por ejemplo, todos los objetos tienen un método `.class` que nos devuelve la clase del propio objeto:

```ruby
> irb

>> a = "hello"
=> "hello"
>> a.class
=> String
>>
```

En Python para ver el tipo del objeto usamos `type`. No se usa el método `class` como en Ruby, pero existe `__class__` que hace lo mismo aunque en Python se usa `type`. Veamos:

```python
> python

>>> a="hola"
>>> type(a)
<class 'str'>
>>>
>>> a.__class__
<type 'str'>
>>> a.__class__ == type(a)
True
>>> a.__class__ == type.__class__(a)
True
```

Entiendo que `type.__class__(X)` devuelve la clase del objeto X, pero `X.__class__` también devuelve la clase del objeto X.

Entonces tenemos `__class__` y `__class__()` ¿cuál es la diferencia? El primero es un atributo de objeto que devuelve la clase del propio objeto, y el segundo es un método constructor heredado de la clase del objeto. De modo que `a.__class__("adios")` invoca al método constructor de la clase del objeto `a` para construir la nueva instancia con el argumento "adios".

> En Ruby el método constructor lo tiene la clase, no la instancia. Es un método de clase que no se hereda. No confundir método de la clase con método estático. Los métodos estático si los heredan los objetos de instancia.

```python
>>> a.__class__
<type 'str'>
>>> a.__class__()
''
>>> a.__class__(a)
'hola'
>>> a.__class__("adios")
'adios'
```

Veamos el constructor de Ruby en acción:

```ruby
>> a = "hello"
=> "hello"
>> a.class
=> String
>> b = String.new("bye bye")
=> "bye bye"
>> b.class
=> String
>> b = a.new("bye bye again")
Undefined method new for "hello":String (NoMethodError)
Did you mean?  next                           
>>
```

El método contructor `new` lo posee la clase, no la instancia.

> Aunque habitualmente usamos syntax sugar parar crear las cadenas de texto. ;-)

_Para averiguar qué somos hemos llegado a cómo nacemos._
