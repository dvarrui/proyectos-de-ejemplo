
# Good Bye OOP

Enlace de interés:
* [Good Bye OOP](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53)

---

# La herencia: Problema de la herencia múltiple

**La herencia NO es un pilar importante**: Es mejor la composición que la herencia.

* En Ruby NO se permite la herencia múltiple. Para resolver este problema tiene los MIXINS.
* [Ejemplo1: herencia01.rb](./files/herencia01.rb): No hay herencia múltiple. Ejemplo de la salida:
```
iloveruby> ./herencia1.rb
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

> ¡ME ENCANTA RUBY!
