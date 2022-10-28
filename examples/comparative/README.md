
# Comparativa

> Enlaces de interés:
> * Algunos ejemplos e ideas se han extraído del proyecto [Rosetta Code](http://rosettacode.org/wiki/Rosetta_Code)

## String

String es un tipo de dato. Tanto en Python como en Ruby los Strings son objetos.

### Averiguar el tipo de un objeto

En Ruby todos los objetos tienen un método `.class` que nos devuelve la clase del Objeto:

```ruby
> irb

>> a = "hello"
=> "hello"
>> a.class
=> String
>>
```

En Python para ver el tipo del objeto usamos la función `type`, no se usa el método `class` como en Ruby, pero existe un método `__class__()`... voy a usarlo.

```python
> python

>>> a="hola"
>>> type(a)
<class 'str'>
>>>
>>> a.__class__()
''
```

> En Python existe un método `__class__()` que yo pensaba serviría para devolver la clase del objeto, pero me equivoqué. Busco información (https://stackoverflow.com/questions/48066220/python-class)

```python
>>> type.__class__(a)
<class 'str'>
>>> type(type)
<class 'type'>
>>> type.__class__()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: type() takes 1 or 3 arguments
```

Parece que existe una función `type(X)` que devuelve el tipo de un objeto X, pero también existe un objeto/clase `type` de tipo `type` que tiene un método `__class__(X)` que nos devuelve el tipo de un objeto X.

> IMHO: Me surge la duda. ¿Entonces `type` es una función, una clase, un objeto?
> * Parece una función por la forma de invocarse `type(X)`.
> * Parece un objeto o tipo de dato, porque tiene tipo `type(type) => <class 'type'>`, y tiene el método `type.__class__(X)`
> * No parece un objeto porque no se aprecia que se invoque a un constructor de una clase para crearlo.

Puesto que los Strings son objetos, debe existir un método constructor definido en la clase que al invocarse crea una instancia del objeto.

* Ejemplo Ruby:

```ruby
>> b = String.new("Bye")
=> "Bye"
>> b.class
=> String
>>
```

```python
>>> b = str("adios")
>>> type(b)
<class 'str'>
```

```
>>> c = str.__new__("Hasta luego")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: str.__new__(X): X is not a type object (str)
>>> c = str.__new__(b)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: str.__new__(X): X is not a type object (str)
>>> c = str.__new__(str)
>>> c
''
```


```ruby
>> c = String("Good bye")
=> "Good bye"
>> c.class
=> String
```

```python
>>> a = "hola"
>>> a.__len__()
4
>>> len(a)
4
>>>
```

```ruby
>> a = "hello"
=> "hello"
>> a.length
=> 5
>> a.size
=> 5
>>
```
