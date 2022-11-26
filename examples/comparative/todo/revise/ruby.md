
# Filosofía de Ruby

# Wikipedia

Ruby es un **lenguaje de programación interpretado**, **reflexivo y orientado a objetos**, creado por el programador japonés Yukihiro "Matz" Matsumoto, quien comenzó a trabajar en Ruby en 1993, y lo presentó públicamente en 1995. Combina una sintaxis inspirada en Python y Perl con características de programación orientada a objetos similares a Smalltalk. Comparte también funcionalidad con otros lenguajes de programación como Lisp, Lua, Dylan y CLU. Ruby es un lenguaje de programación interpretado en una sola pasada y su implementación oficial es distribuida bajo una licencia de software libre.

---

# Ruby: Filosofía

El creador del lenguaje, Yukihiro "Matz" Matsumoto, ha dicho que Ruby está **diseñado para la productividad y la diversión del desarrollador**, siguiendo los principios de una buena interfaz de usuario. Sostiene que el diseño de sistemas necesita enfatizar las necesidades humanas más que las de la máquina:

> A menudo la gente, especialmente los ingenieros en computación, se centran en las máquinas. Ellos piensan, "Haciendo esto, la máquina funcionará más rápido. Haciendo esto, la máquina funcionará de manera más eficiente. Haciendo esto..." Están centrados en las máquinas, pero en realidad necesitamos centrarnos en las personas, en cómo hacen programas o cómo manejan las aplicaciones en los ordenadores. Nosotros somos los jefes. Ellos son los esclavos.

Ruby sigue el principio de la menor sorpresa, lo que significa que el lenguaje debe comportarse de tal manera que minimice la confusión de los usuarios experimentados. Matz ha dicho que su **principal objetivo era hacer un lenguaje que le divirtiera a él mismo, minimizando el trabajo de programación y la posible confusión**.

Matz trató de distanciar Ruby de la mencionada filosofía, explicando que cualquier elección de diseño será sorprendente para alguien, y que él usa un estándar personal de evaluación de la sorpresa. Si ese estándar personal se mantiene consistente habrá pocas sorpresas para aquellos familiarizados con el estándar.

> El principio de la menor sorpresa no es sólo para ti. Y significa el principio de la menor sorpresa después de que aprendes bien Ruby. Por ejemplo, fui programador de C++ antes de empezar a diseñar Ruby. Programé exclusivamente en C++ durante dos o tres años. Y después de dos años de programar en C++, todavía me sorprendía.

---


# Ruby: Características

* Orientado a objetos
* Cuatro niveles de ámbito de variable: global, clase, instancia y local.
* Manejo de excepciones
* iteradores y clausuras o closures (pasando bloques de código)
* expresiones regulares nativas similares a las de Perl a nivel del lenguaje
* Posibilidad de redefinir los operadores (sobrecarga de operadores)
* recolección de basura automática
* Altamente portable
* Hilos de ejecución simultáneos en todas las plataformas usando hilos verdes, o no gestionados por el sistema operativo.
* Carga dinámica de DLL/bibliotecas compartidas en la mayoría de las plataformas
* Introspección, reflexión y metaprogramación
* Amplia librería estándar
* Soporta inyección de dependencias
* Soporta alteración de objetos en tiempo de ejecución
* continuaciones y generadores

---

# Bloques de código y la programación funcional

En este [blog](http://www.clubdetecnologia.net/blog/2014/programacion-funcional-ejemplos/) se comenta cómo los lenguajes tradicionales han ido inporporando elementos de la programación funcional. Por ejemplo Java 8 al incluir las expresiones lambda. No todos los lenguajes imperativos han hecho este acercamiento a la programación funcional, otros sí.

> Por ejemplo Ruby tiene:
> * lambdas (bloques de código anónimo), y
> * procedimientos (objetos POO que son bloques de código)
> Estas partes de Ruby lo son todo en Ruby. En Ruby se potencia el uso de los bloques de código para resolverlo todo. Esto provoca confusión a los que vienen de lenguajes más imperativos porque no han percibido la presencia de la programación funcional en esas líneas de código. A veces he oído decir que "Ruby tiene magia" en sentido de código ofuscado que no se sabe lo que hace. A mi me gusta pensar que "Ruby tiene magia" porque es maravilloso, bonito y espectacular la forma de resolver problemas usando los paradigmas funcional y POO.

Veamos lso ejemplos del artículo, pero esta vez usando Ruby.

Ejemplo 1: Forma tradicional.
```
found = false
for city in cities
  if city == "Chicago"
    found = true
    break
  end
end

puts "Found chicago?: #{found}"
```

Ahora ejemplo2 utilizando el estilo declarativo:
```
puts "Found chicago?: #{ cities.include?("Chicago") }"
```

> No quiero imponer mi forma de pensar a nadie. Sólo opinar...¡Guau! ¡Qué forma tan elegante de resolver el problema! #iloveruby

Como pone el artículo las mejoras son:
* Disminuir el uso de variables
* Iteración como parte de la función
* Menos código
* Mejora claridad, mantiene el foco
* Código más cerca a las intenciones del algoritmo
* Menos errores
* Fácil de entender y mantener

---

# Closures en Ruby: Bloques, Procs y Lambdas

Enlace de interés:
* [Closures in Ruby: Blocks, Procs and Lambdas](https://blog.appsignal.com/2018/09/04/ruby-magic-closures-in-ruby-blocks-procs-and-lambdas.html)

Ruby tiene closures en forma de bloques, procs y lambdas. Así se consigue gran parte de la "magia" de Ruby.
* Bloques
    * Se usa para pasar bloques de código a los métodos.
    * Se usan contínuamente en Ruby.
    * El método `yield` se usa para invocar la ejecución del bloque.
    * Los bloques se comportan como Procs pero no se pueden almacenar en variables.
* Procs
    * Permite almacenar bloques de código en variables.
* Lambda:
    * Permite almacenar bloques de código en variables.
    * Son Procs que se comportan como métodos.
    * Fuerza que el número de argumentos pasados cuando se invoca.
    * Devuelve métodos con el entorno de ejecución del padre.

---

# Ruby: Resumen

|   | Resumen |
| - | ------- |
| 1 | Productividad y la diversión del desarrollador |
| 2 | Reflexivo y Orientado a Objetos |
| 3 | Interpretado |
| 4 | Tipado dinámico y fuerte |
| 5 | Multiplataforma |
| 6 | Licencia de software libre |
| 7 | Facilidad de extensión (Módulos en C++) |
| 8 | Metaprogramación |

# Controversia

|   | Ruby |
| - | ---- |
| 1 | Diversión y productividad del desarrollador |
| ? | Principio de menor sorpresa |
