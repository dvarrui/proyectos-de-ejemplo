
![](images/logo.png)

# Proyecto: SOFA (versión 1.0)

## Antecedentes

Para evitar charlas agotadoras de si este lenguaje de programación POO o no lo es, si tiene ocultación o no la tiene y por tanto si es pero no es....

Todo derivado de que cada uno interpreta POO de manera un poco o mucho diferente.
Esto vamos a tratar de objetivizarlo un poco más para evitar discusiones de bucle.

# Propuesta

Vamos a buscar una forma de medir que nos sea Si o NO, que sea gradual como de 0 a 9.

Pero como hay muchos elementos diferentes en cada lenguaje que pueden tener diferentes grados (0-9) de
implantación... entonces vamos a tratar de medir eso valores y unirlos para tener un número qie identifique a cada lenguaje.

Ya no discutimos más, vemos el valor del lenguaje y ya sabemos lo que tiene y cómo lo implementa.

# Implementación

Además este número va a tener 4 dimensiones, según el grado que estemos midiendo:
* **S**tructured programming paradigm
* **O**bject oriented programming paradigm |
* **F**unctional programming paradigm |
* **A**nother features

## Unidad de medida SOFA

Concretando... propongo a vuestra revisión y consideración la siguiente implementación de la propuesta de solución anterior que llamaremos unidades SOFA.

Ahora vamos a explicar SOFA (versión 1.0). SOFA es una implementación de un calificador para definir lenguajes de programación.

Y para definir/calificar un lenguaje vamos a usar 4 dimensiones: S, O, F, A.

| Letra | Descripción |
| ----- | ----------- |
| S     | **S**tructured programming paradigm |
| O     | **O**bject oriented programming paradigm |
| F     | **F**unctional programming paradigm |
| A     | **A**nother features |

Cada lenguaje de programación obtendrá una valor en cada dimensión que ayudará a definirlo de forma "grano fino". Este valor de 4 dimensiones podrá tomar valores entre 0000 y 9999. Cada lenguaje tendrá un valor numérico que será su valor SOFA.

## Plantilla de evaluación (rúbrica)

| Bit | Structured P.  | Object Oriented P.   | Functional     | Another features |
| --- | -------------- | -------------------- | -------------- | ---------------- |
| 10  |                | Encapsulación clásica| Funcional puro | Compilado a cód. nativo |
| 09  |                | Encapsulación débil  | funcional Híbrido | Compilado cód. intermedio |
| 08  |                | Abstracción clásica  | No funcional         | Interpretado |
| 07  |                | Abstracción débil    | Func. orden superior | Tipado estático |
| 06  |                | Herencia clásica     | Func. de 1a clase | Tipado dinámico |
| 05  |                | Herencia prototipos  | Eval. estricta      | Tipado fuerte |
| 04  | E. secuencial  | Polimorfismo clásico | Eval. no estricta   | Tipado débil |
| 03  | E. condicional | Polimorfismo débil   | Tipos dependientes  | Reflexivo |
| 02  | E. iterativa   | Ocultación fuerte    | Inferencia de tipos | Metaprogramación clásica |
| 01  | Inst. goto     | Ocultación débil     | Sin tipos           | Metaprogramación debil/laxa |

Veamos un ejemplo [calculando el valor SOFA de Ruby](ruby.md):

Por ejemplo, **Ruby** es **0E-EQ-50-FM** Sofa. Este valor puede servir para ayudar a medir la cercanía y/o lejanía de los diferentes lenguajes de programación entre sí.

¿Me ayudas creando la [plantilla](plantilla.md) de tu lenguaje de programación favorito para añadirla a esta "frikada"?
