
![](images/logo.png)

# Proyecto: SOFA (versión 1.0)

## Antecedentes

## Propuesta

# Implementación

## Unidad de medida

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
