
# Good Bye OOP

> Steve me pasó el siguiente enlace (["Good Bye OOP"](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53)) el 1 de enero de 2019, y no pude resistir la tentación de empezar a leerlo. El título era demasiado atrevido para dejarlo pasar.
>
> ¿Cómo era posible que alguien hiciera una artículo analizando la POO para intentar descartarla?
>
> El paradigma POO era un pilar fundamental en mis construcciones mentales. ¿Había llegado el momento de cambiar? ¿Acaso se había descubierto algo mejor? ¡Uff!
>
> Decidí portarme como un valiente. Empecé a leer el artículo ["Good Bye OOP"](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53) y me puse a escribir mis pensamientos...

---

# Antecendentes

El autor comenta que tiene mucha experiencia en POO, usando los lenguajes C++, Smalltalk, .NET y Java.

# La herencia: el primer pilar en caer.

Pienso igual que el autor en que **la herencia NO es un pilar importante** de la POO. Apesar de que sea lo primero que se enseña y se pone mucho énfasis. Pero es por una cuestión de que es fácil de ver y es educativo.

Pero es verdad que a la hora de la verdad la herencia NO es tan importante como nos la han "vendido". Es mejor la composición que la herencia. En el sentido de que la composición es lo que nos permitirá resolver la mayoría de los problemas reales que nos vamos a encontrar.

> **Conclusiones:**
> * Cuando nos enseñaron las clases pusieron demasiado énfasis en la herencia.
> * Hay que tener un poco de sentido común y no hay que creerse lo que diga la documentación hasta que no lo experimentemos por nosotros mismos.

---

# La herencia múltiple: _The diamond problem_

> Estoy de acuerdo con lo que dice el autor acerca de que la teoría de la herencia múltiple es muy bonita, pero a la hora de implementarla la cosa no está tan clara.
>
> De hecho C++ si tiene herencia múltiple, pero C#, Java y Ruby NO tienen herencia múltiple. ¡Problema resuelto!
>
> Pero ¿hay alguna forma "razonable" de tener la función de "herencia múltiple"? Porque incluso C++ tiene "problemillas" con ella.

* En Ruby NO se permite la herencia múltiple. Para resolver este problema tiene los MIXINS.
* [Ejemplo1 (herencia01.rb)](./files/herencia01.rb): No hay herencia múltiple. Ejemplo de la salida:
```
files> ./herencia01.rb
Scanner: Starting...
 * Scanning...
```

* [Ejemplo2: (herencia02.rb)](./files/herencia02.rb): Resolver el problema de la herencia múltiple usando Mixins.
    * El código que queremos reusar se escribe en módulos (clases no instanciables).
    * Cada clase puede reutilizar el códido de dichos módulos usando `include` (_Parecido al include de PHP_).
    * En el ejemplo tenemos un nuevo dispositivo que tiene código de Scanner y de Printer.
```
files> ./herencia02.rb
PowerDevice: Starting...
 * Scanning...
 * Writting...
```

* Hay otras formas de resolver este problema (_problema del diamante_) como  _"contain and delegate"_. Pero requieren trabajo manual para ajustarla... los Mixins son mucho más fáciles de usar.

> **Conclusiones:**
> * Teniendo _Mixins_ tenemos el efecto de herencia múltiple. Siendo más felices.
> * _¡Me encanta la forma de pensar de Ruby!_

---

# La herencia: _The Fragile Base Class Problem_

* Creamos la clase base ([MyArrayBase](./files/my-array-base.rb)) y la probamos ([base01.rb](./files/base01.rb)):
```
files> ./base01.rb
[ DO ] MyArrayBase => add 1, add 2, add 3
[INFO] [1, 2, 3]
[ DO ] MyArrayBase => add_all [4,5,6]
[INFO] [1, 2, 3, 4, 5, 6]
```
* Creando la clase [MyArrayCount](./files/my-array-count.rb) y [probándola](./files/base02.rb):
```
files> ./base02.rb
[ DO ] MyArrayCount => add 1, add 2, add 3
[INFO] count = 0 with [1, 2, 3]
[ DO ] MyArrayCount => add_all [4,5,6]
[INFO] count = 3 with [1, 2, 3, 4, 5, 6]
```

> Todo ¡OK! por ahora...

* ¡Rompamos la clase base como indica el enlace! ¡Ohps! ¡No se puede romper en Ruby. En Ruby no está la "a" (del ejemplo del enunciado) para poderla quitar.

```
Java: ¡Vale, si! ¿Pero por qué en Ruby funciona?...
Ruby: Porque Ruby usa "Duck typing" en lugar de tipado estático.

Ruby: El problema viene que Java debe hacer un "invento" para crear
      una clase que al mismo tiempo sirva para cualquier tipo de dato.
      Por esto Java tiene esa "a"

         private ArrayList<Object> a = new ArrayList<Object>();

      que se irá cambiando según el tipo de datos
      que se quieran guardar en el Array de Java.

      Al quitar la "a" del metodo de la clase base...
      la clase derivada invoca al método add de la clase base, pero
      ésta a su vez invoca al método de la clase derivada y NO a la
      suya misma... porque la suya es "a.add"!!!

      Ruby NO tiene ese problema porque tiene tipado dinámico
      y además "Duck typing".
      Una clase se declara y...
      "da igual el tipo de los objetos dentro del array".

Ruby: Duck typing... si se habla como un pato, nada como un pato y
      camina como un pato... yo lo trato como un pato.  
```

> while(true) { "I love ruby" }
