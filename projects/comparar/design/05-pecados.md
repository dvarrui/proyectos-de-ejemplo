[<< back](./README.md)

# 5. Los pecados

Cada lenguaje de programación tiene su propio modelo cognitivo, y cada uno es correcto desde su propio punto de vista. No son comparables entre sí. Pero hay modelos cognitivos que están mejor diseñados que otros. Esto es, hay modelos con más incongruencias que otros.

IMHO: Cuando un lenguaje infringe sus principios de diseño base tiene incongruencias serias y debe valorarse negativamente a la hora de tenerlo en cuenta.

En el diseño de lenguajes, la coherencia no es solo un capricho estético; es lo que permite que un programador pueda "predecir" el comportamiento del lenguaje sin tener que consultar la documentación contínuamente.

Cuando un lenguaje viola sus propios principios, rompe el Modelo Mental que el programador ha construido, tenemos falta de ortogonalidad.

## 5.1 Ortogonalidad y Consistencia

Un lenguaje es "ortogonal" cuando sus reglas son independientes y no tienen excepciones extrañas al combinarse.

* Si el lenguaje dice: "Todo es un objeto". 
* Y luego dice: "Bueno, excepto estos 8 tipos primitivos que se comportan distinto por razones de rendimiento".
* Resultado: El modelo cognitivo se fractura. Tenemos que memorizar casos especiales en lugar de aplicar una lógica universal.

## 5.2 Incongruencias Graves

Hay lenguajes que han sobrevivido a pesar de sus contradicciones internas, pero que desde un punto de vista purista, son "modelos con fallos":

| Lenguaje             | El Principio que rompe | La Incongruencia  |
| -------------------- | ---------------------- | ----------------- | 
| JavaScript (clásico) | Coherencia de tipos    | `[] == ![]` es `true` | El modelo de coerción de tipos es inconsistente y nos obliga a usar herramientas externas (Linters) para evitar partes del lenguaje |
| PHP (antiguo)        | Predictibilidad de APIs | El orden de los parámetros en las funciones de manejo de strings es distinto al de los arrays. No hay un patrón, hay que memorizar |
| C++                  | Simplicidad y seguridad | Modelo cognitivo es grando y permite tantas formas de hacer lo mismo (algunas peligrosas) que es difícil que dos programadores tengan el mismo modelo mental del lenguaje |

## 5.3 Los lenguajes nuevos

Los lenguajes de nueva creación (Por ejemplo, Rust, Go o Zig) intentan volver a la pureza del diseño:

* **Rust**: Tiene un modelo cognitivo estricto (Ownership). Si lo violas, el código no compila. Frustrante, pero es coherente.
* **Elm**: En el frontend, es famoso por ser "perfecto". Si compila, funciona. No tiene excepciones a sus reglas.

---
---
Estamos hablando de principios de diseño base del lenguaje que se incumplen. O de excepciones que rompen la norma. Si es que hay alguna.

Tienes toda la razón. He caído en la trampa de listar "puntos de fricción" o dificultades de aprendizaje en lugar de violaciones estructurales de los axiomas del lenguaje.

Si nos ponemos rigurosos con la teoría de lenguajes, una incongruencia es una ruptura del contrato fundamental del modelo cognitivo. Vamos a filtrar el ruido y buscar donde estos lenguajes realmente "mienten" respecto a sus propios cimientos.


Si aplicamos este rigor:

    JavaScript debería ser el primero en caer: su modelo de "Prototipos" es ignorado por su propia sintaxis de class (que es una farsa semántica) y su igualdad no es transitiva.

    Python se salva por "pragmatismo", pero su modelo cognitivo es, en realidad, un conjunto de reglas con muchas notas al pie de página.

    Ruby es quizás de los más honestos, excepto por esa distinción técnica entre bloque y objeto.

El problema real: Casi todos los lenguajes industriales son "híbridos" que han sacrificado la pureza del modelo cognitivo para ganar rendimiento o adopción masiva.


