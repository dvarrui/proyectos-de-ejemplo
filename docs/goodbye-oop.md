
# Good Bye OOP

Enlace de interés:
* [Good Bye OOP](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53)

---

# La herencia: "El problema del diamante" resuelto

**La herencia NO es un pilar importante**: Es mejor la composición que la herencia.

* En Ruby NO se permite la herencia múltiple. Para resolver este problema tiene los MIXINS.
* [Ejemplo1: herencia01.rb](./files/herencia01.rb): No hay herencia múltiple. Ejemplo de la salida:
```
files> ./herencia01.rb
Scanner: Starting...
Scanning...
```

* [Ejemplo2: herencia02.rb](./files/herencia02.rb): Resolver el problema de la herencia múltiple usando Mixins.
```
files> ./herencia02.rb
PowerDevice: Starting...
Scanning...
Writting...
```

* El problema del diamante resuelto SIN usar _"contain and delegate"_.

> ¡Me encanta la forma de pensar de Ruby!

---

# La herencia: El problema de la clase base resuelto.

* Creando la clase [MyArrayBase](./files/my-array-base.rb) y [probándola](./files/base01.rb):
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

* ¡Rompamos la clase base como indica el enlace! ¡Ohps! ¡No se puede romper en Ruby.
```
Java: ¡Vale, si! ¿Pero por qué en Ruby funciona?...
Ruby: Porque Ruby usa "Duck typing" en lugar de tipado estático.

Ruby: El problema viene que Java debe hacer un "invento" para crear
      una clase que al mismo tiempo sirva para cualquier tipo de dato.
      Por esto Java tiene esa "a"

         private ArrayList<Object> a = new ArrayList<Object>();

      que se irá cambiando según el tipo de datos
      que se quieran guardar en el Array de Java.

      Ruby NO tiene ese problema porque tiene tipado dinámico y además "Duck typing". Una clase se declara y... "da igual el tipo de los objetos dentro del array".

Ruby: Duck typing... si se habla como un pato, nada como un pato y
      camina como un pato... yo lo trato como un pato.  
```

> while(true) { "I love ruby" }
