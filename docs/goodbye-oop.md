
# Good Bye OOP

Enlace de interés:
* [Good Bye OOP](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53)

---

# La herencia: "El problema del diamante" resuelto

**La herencia NO es un pilar importante**: Es mejor la composición que la herencia.

* En Ruby NO se permite la herencia múltiple. Para resolver este problema tiene los MIXINS.
* [Ejemplo1: herencia01.rb](./files/herencia01.rb): No hay herencia múltiple. Ejemplo de la salida:
```
iloveruby> ./herencia01.rb
Scanner: Starting...
Scanning...
```

* [Ejemplo2: herencia02.rb](./files/herencia02.rb): Resolver el problema de la herencia múltiple usando Mixins.
```
iloveruby> ./herencia02.rb
PowerDevice: Starting...
Scanning...
Writting...
```

* El problema del diamante resuelto SIN usar _"contain and delegate"_.

> ¡Me encanta la forma de pensar de Ruby!

---

# La herencia: El problema de la clase base resuelto.
