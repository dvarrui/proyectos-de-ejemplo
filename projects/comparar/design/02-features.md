[<< back](./README.md)

# 2. Características

```
¿Los modelos cognitivos de los lenguajes de programación tienen características
que sean más "deseables" que otras?
```

En el mundo de la programación, no existe un "modelo mejor" en términos absolutos, pero sí existen características que facilitan o complican el trabajo del programador. Se busca reducir la **Carga Cognitiva**. Esto es, la cantidad de esfuerzo mental necesario para entender, escribir y mantener el código.

## 2.1 Características Deseables

Características que permiten que el cerebro humano procese la lógica de forma más eficiente y con menos errores.

* **Abstracciones de Alto Nivel**: Un buen modelo permite pensar en términos o conceptos del problema a resolver. Por ejemplo si es un problema es un programa para un negocio, es mejor no tener que pensar en la gestión de memoria, los registros de la CPU, etc.
* **Razonamiento Local**: Es la capacidad de entender una función o bloque de código mirando solo ese bloque, sin tener que saber qué está pasando en el resto del proyecto (fuera de nuestra vista).
* **Declaratividad**: Los modelos que describen el resultado final (como SQL o CSS) suelen ser más adecuados para problemas de alto nivel porque eliminan la necesidad de gestionar estados intermedios complejos. Pero son inadecuados para problemas de bajo nivel donde es necesario controlar los recursos del sistema. Esto es, el cómo.
* **Componibilidad**: Facilidad para unir piezas para formar sistemas grandes.
* **Inmutabilidad (por defecto)**: Elimina el miedo a que una variable cambie de valor "mágicamente" en otra parte del programa. Esto reduce drásticamente el estrés mental. Es adecuada para alto nivel pero no para bajo nivel.

> **NOTA**: Creo que habría que diferenciar características deseables para lenguajes de alto nivel y para lenguaje de bajo nivel.

## 2.2 Características no deseables

Generan fatiga, bugs y lo que llamamos "deuda técnica".

* **Estado Global Mutante**: Si cualquier parte del programa puede cambiar una variable que afecta a todo el sistema, el cerebro tiene que estar pendiente de todo el programa a la vez. Es imposible.
* **Efectos Secundarios Ocultos (Side Effects)**: Cuando se llama a una función/método para "calcular un precio" y, de paso, esa función borra un archivo en el disco duro. Esa falta de honestidad rompe el modelo mental.
* **Alta Ceremonia (Boilerplate)**: Lenguajes que te obligan a escribir 20 líneas de código "burocrático" para hacer algo simple. Esto distrae al programador de la lógica real.
* **Falta de Ortogonalidad**: Cuando las características del lenguaje interfieren entre sí. Por ejemplo, que no poder usar una característica "A" si ya estás usando la "B".

## 2.3 Comparativa: Carga Cognitiva vs. Control

A menudo hay un intercambio (trade-off). No es que el modelo de C sea "peor" que el de Python, es que tienen objetivos distintos:

| Característica | Modelo de Bajo Nivel | Modelo de Alto Nivel |
| -------------- | -------------------- | -------------------- |
| Control total sobre la máquina | Alto | Bajo |
| Velocidad de desarrollo y claridad | Bajo | Alto |
| Carga Cognitiva | Alta: Debes pensar en punteros, memoria y tipos | Baja: Piensas en la lógica del problema |
| Riesgo        | Alto (fugas de memoria, crashes) | Bajo (errores de lógica, menor rendimiento) |
| Orientación   | Sistemas operativos o drivers    | Aplicaciones web o ciencia de datos |

## 2.4 La "Métrica del WTF"

De broma, en ingeniería de software, a veces medimos la calidad de un modelo cognitivo por la cantidad de veces que alguien grita "¡¿QUÉ ES ESTO?!" al leer el código de otro. Un modelo "bueno" es aquel que, tras meses sin verlo, te permite entender la intención del autor en pocos segundos.
