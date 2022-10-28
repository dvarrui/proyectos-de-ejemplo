[<< back](README.md)

# El huevo

_¿Qué fué antes el huevo o la gallina? ¡El huevo!_

Resulta que la clase `str` es un objeto y por tanto... ¿es una instancia de otra clase superior? ¡Si! La clase `type` es la clase de las clases. Por convención la clase de type es type. En estos casos los nombres de las clases están en minúsculas.

```python
>>> str.__class__
<type 'type'>
>>> type("hola".__class__)
<type 'type'>
>>> type(type)
<type 'type'>
```

Durante mucho tiempo estuve confundido porque pensaba que `type(X)` era una invocación a una función, pero no.

Como `type` es una clase, y para constuir instancias en python se hace `NombreClase(arg)`, entiendo que `type(X)` es la invocación del constructor de la clase `type`, usando como argumento a `X`. Internamente el constructor de la clase `type` leerá la propiedad `X.__class__` para averiguar la clase del objeto y poder devolverlo en el constructor.

> DUDAS:
> 1. ¿Por qué las clases type, str, int son minúsculas cuando la recomendación para crear las clases en Python es nombrarlas PascalCase?
> 2. ¿Será para mantener deliveradamente la "sensación" de que estamos invocando a una función aunque no sea cierto?
> 3. ¿Es porque en versiones anteriores de Python existían esas funciones y al crear las clases/objetos se decidió mantenerlos en minúscula para que pareciera que nada había cambiado? El hecho de que hayan llamado a la clase padre `type` me hace pensar que es así. De modo que cuando se muestra la clase de un objeto en Python aparece `<type 'str'>` como queriendo decir que el objeto es de "tipo string".

En Ruby un objeto tiene una clase y esa clase tiene la clase `Class`. Por convención la clase Class tiene a ella misma como clase. En Ruby, siempre se sigue el criterio `PascalCase` para los nombres de las clases.

```ruby
>> a = "hello"
=> "hello"
>> a.class
=> String
>> String.class
=> Class
>> Class.class
=> Class
```

