[<< back](./README.md)

# 3. Distancia

```
Lo ideal sería que el modelo del problema que se quiere resolver
haga match perfecto con el modelo cognitivo del lenguaje que se va a usar
para considerarlo el lenguaje apropiado para ese problema
```

Cuando el modelo mental de la solución y el modelo cognitivo del lenguaje están alineados, el código se siente natural. Esto es reducir la **Distancia Cognitiva**.

## 3.1 El concepto de "Distancia Cognitiva"

La Distancia Cognitiva es el esfuerzo que debe hacer el cerebro para traducir una idea de la vida real a instrucciones de computadora.

* **Poca distancia**: Si estamos diseñando una base de datos de contabilidad y usamos SQL, el lenguaje habla de "tablas", "relaciones" y "conjuntos", es el match adecuado.
* **Mucha distancia**: Intentas programar una interfaz gráfica de usuario (GUI) altamente interactiva usando C/asm puro. El cerebro quiere pensar en "botones" y "menús", pero el lenguaje te obliga a pensar en "punteros de memoria" e "interrupciones de hardware". La distancia es enorme y ahí es donde aparece un alto esfuerzo.

## 3.2 Ejemplos de "Matches"

Ejemplos de casos donde la elección del lenguaje se basa totalmente en que su modelo cognitivo "imita" la naturaleza del problema:

| Problema   | Modelo del Problema            | Lenguaje apropiado | Justificación |
| ---------- | ------------------------------ | ------------------ | ------------- |
| Chat       | Millones de procesos paralelos | Erlang/Elixir      | Modelo de Actores. Cada usuario es un "proceso" aislado que envía mensajes |
| Inteligencia Artificial / Datos | Transformaciones matemáticas y estadísticas sobre grandes volúmenes | R, Python (NumPy) | Sintaxis similar a la notación matemática |
| Blockchain | Reglas estrictas de "si pasa A, entonces se transfiere B" | Solidity | Modelo de "máquina de estados" con propiedad integrada |
| Navegadores Web | Documentos jerárquicos con estilos visuales | HTML/CSS | Lenguajes declarativos. No dices cómo dibujar, dices que hay que dibujar |

## 3.3 Forzar el match

A veces, por moda o por exigencias del proyecto, usamos un lenguaje que no es el adeucado para el modelo del problema. Esto produce una gran **Fricción Mental**. Sentimos que estamos "luchando contra el lenguaje" en lugar de usarlo como una herramienta.
