
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
```
