
# Calculado SOFA de Ruby

Partimos de la plantilla y vamos poniendo:
* un 1 punto si cumple el ítem
* un 0 si no lo cumple.

| Bit | Structured P.  | S | Object Oriented P.   | O | Functional     | F | Another features | A |
| --- | -------------- | - |--------------------- | - | -------------- | - | ---------------- | - |
| 10  |                |   |                      | 0 | Func. puro     | 0 | Compilado a cód. nativo | 0 |
| 09  |                |   | Encapsulación        | 1 | Func. Híbrido   | 0 | Compilado cód. intermedio | 1 |
| 08  |                |   | Abstracción          | 1 | No funcional      | 1 | Interpretado | 1 |
| 07  |                |   | Herencia simple      | 1 | Func. orden superior |0 | Tipado estático | 1 |
| 06  |                |   | Herencia múltiple    | 0 | Func. de 1a clase | 1 | Tipado dinámico | 1 |
| 05  |                |   | Herencia mixins      | 1 | Eval. estricta      | 0 |Tipado fuerte | 1 |
| 04  | E. secuencial  | 1 | Polimorfismo clásico | 1 | Eval. no estricta   | 0 | Tipado débil | 0 |
| 03  | E. condicional | 1 | Polimorfismo débil   | 0 | Tipos dependientes  | 0 | Reflexivo | 1 |
| 02  | E. iterativa   | 1 | Ocultación fuerte    | 1 | Inferencia de tipos | 0 | Metaprogramación | 1 |
| 01  | Inst. goto     | 0 | Ocultación débil     | 0 | Sin tipos           | 0 | Meta. debil/laxa | 0 |

Ahora unimos todos los bits de S,O,F y A para calcular su valor binario y lo ponemos en la siguiente tabla:

> [Convertir Hexadecimal a Base-32](https://www.translatorscafe.com/unit-converter/es-ES/numbers/4-35/hexadecimal-base-32/)

| Dimensión | Binario    | Hexa. | Base32 |
| --------- | ---------- | ----- | ------ |
| S         | 0000001110 | 00E   | 0E     |
| O         | 0111011010 | 1DA   | EQ     |
| F         | 0010100000 | 0A0   | 50     |
| A         | 0111110110 | 1F6   | FM     |

A continuación unimos los valores de las 4 dimensiones:
* Valor hexadecimal 00E-1DA-0A0-1F6
* Valor base32 : 0E-EQ-50-FM

**Ruby** es **0E-EQ-50-FM** Sofa.

Si nos fijamos Ruby tiene un alto valor O y A. Y valor bajo en F. El valor S debe ser el mismo en todos los lenguajes modernos pero puede hacer lenguajes antiguos con S diferente. Este valor puede servir para ayudar a medir la cercanía y/o lejanía de los diferentes lenguajes de programación entre sí.

¿Me ayudas creando la plantilla de tu lenguaje de programación favorito para añadirla a esta "frikada"?
