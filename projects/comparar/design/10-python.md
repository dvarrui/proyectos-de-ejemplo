[<< back](./README.md)

# Python

```
Incongruencias del modelo congnitivo en el lenguaje
```

Es un lenguaje "amigables", pero sus incongruencias nacen precisamente de los atajos que tomaron para lograr esa amabilidad.

Aquí tienes las fracturas en sus modelos cognitivos:

## 1. "Debería haber una sola forma obvia" (Pero no)

El mantra de Python es el Zen de Python: "Explicit is better than implicit" y "There should be one—and preferably only one—obvious way to do it". Sin embargo, el lenguaje tiene "excepciones":

* **¿Función o Método? (len() vs .upper())**: Para saber la longitud de un texto, se usa `len(text)` (función global). Pero para convertir un texto a mayúsculas, se usa `text.upper()` (método de objeto). Si el modelo es orientado a objetos, ¿por qué no usar `len` como un método? La explicación oficial es por rendimiento y "legibilidad", pero rompe la consistencia del modelo de objetos.
* **Scoping (Ámbito de variables):** Un bucle `for` no crea un nuevo ámbito. Si declaras `for i in range(10)`, la variable `i` sigue viva fuera del bucle. Sin embargo, en las funciones sí hay un ámbito nuevo. Esta inconsistencia obliga al cerebro a llevar un mapa de "dónde sobrevive qué".
* **El "Self" explícito**: El lenguaje presume de ser limpio, pero obliga a escribir `self` como primer argumento en cada método de una clase. Es un detalle de implementación que se filtró al modelo cognitivo del programador.

---
2. El caso de Python: La fractura de la "Pureza"

El modelo cognitivo de Python se basa en la legibilidad y la uniformidad (el Zen de Python). Su principio es la transparencia. Pero tiene violaciones estructurales:
A. La filtración de la implementación (Leaky Abstraction)

Python dice ser un lenguaje de alto nivel donde no deberías preocuparte por la gestión interna, pero:

    El ID de los enteros pequeños: Python pre-asigna los enteros del -5 al 256 en memoria por optimización. Si haces a = 256; b = 256; a is b te dirá True. Si lo haces con 257, te dirá False.

        Incongruencia: El operador de identidad (is) debería ser consistente con la lógica del lenguaje, no depender de un truco de optimización del intérprete (CPython). Aquí el modelo cognitivo "choca" con la implementación física.

B. El Ámbito de Comprensión (List Comprehensions)

En Python 2, las list comprehensions filtraban la variable de control al ámbito local (como el for que mencionamos antes). En Python 3 lo arreglaron... pero solo para las comprensiones.

    Si haces [x for x in range(5)], x no existe fuera.

    Si haces for x in range(5): pass, x sí existe fuera.

        Incongruencia: El lenguaje tiene dos estructuras para iterar y cada una aplica una regla de ámbito (scoping) distinta. Esto rompe el principio de "una sola forma obvia" y de predictibilidad.
