[<< back](./README.md)

# Python

```
Incongruencias del modelo congnitivo en el lenguaje
```

El modelo cognitivo de Python se basa en la legibilidad y la uniformidad (el Zen de Python). Su principio es la transparencia. Pero tiene violaciones estructurales originadas posiblemente de tomar atajos para lograr esos principios.

# 1. "Debería haber una sola forma obvia"

El mantra de Python es el Zen de Python: "Explicit is better than implicit" y "There should be one—and preferably only one—obvious way to do it". Sin embargo, el lenguaje tiene "excepciones":

* **¿Función o Método? (len() vs .upper())**: Para saber la longitud de un texto, se usa `len(text)` (función global). Pero para convertir un texto a mayúsculas, se usa `text.upper()` (método de objeto). Si el modelo es orientado a objetos, ¿por qué no usar `len` como un método? La explicación oficial es por rendimiento y "legibilidad", pero rompe la consistencia del modelo de objetos.
* **List Comprehensions vs for**: El lenguaje tiene diferentes estructuras para iterar y cada una aplica una regla de ámbito (scoping) distinta. Esto rompe el principio de "una sola forma obvia" y de predictibilidad.
    * Si haces `[x for x in range(5)]`, x no existe fuera.
    * Si haces `for x in range(5): pass`, x sí existe fuera.

# 2. Carga cognitiva

* **Scoping (Ámbito de variables):** Un bucle `for` no crea un nuevo ámbito. Si declaras `for i in range(10)`, la variable `i` sigue viva fuera del bucle. Sin embargo, en las funciones sí hay un ámbito nuevo. Esta inconsistencia obliga al cerebro a llevar un mapa de "dónde sobrevive qué".

# 3. La filtración de la implementación (Leaky Abstraction)

* **ID de los objetos**: Al ser un lenguaje de alto no deberíamos preocuparnos por la gestión interna, pero por ejemplo se pre-asignan los enteros del -5 al 256 en memoria por optimización. Si hacemos `a = 256; b = 256; a is b` te dirá `True`. Si lo haces con 257, te dirá False.Incongruencia: El operador de identidad (is) debería ser consistente con la lógica del lenguaje, no depender de un truco de optimización del intérprete (CPython). Aquí el modelo cognitivo "choca" con la implementación física.
* **El "Self" explícito**: El lenguaje presume de ser limpio, pero obliga a escribir `self` como primer argumento en cada método de una clase. Es un detalle de implementación que se filtró al modelo cognitivo del programador.

# 4. Resumen

* Principio Violado: "Solo una forma obvia".
* Punto débil: Mezcla de estilo funcional y OO (len(x) vs x.method()).
* Consecuencia: Errores sutiles en el manejo de estados (mutables).
