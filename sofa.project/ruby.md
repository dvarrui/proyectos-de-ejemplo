
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

| Dimensión | Binario    | Hexa. | Base-32 |
| --------- | ---------- | ----- | ------- |
| S         | 0000001110 | 00E   | 0E      |
| O         | 0111011010 | 1DA   | EQ      |
| F         | 0010100000 | 0A0   | 50      |
| A         | 0111110110 | 1F6   | FM      |

Tenemos entonces los valores de las 4 dimensiones SOFA:
* S => 0E
* O => EQ
* F => 50
* A => FM

Lo unimos todo y tenemos el calificador SOFA de Ruby 3.0.3.

```
SOFA = 0E-EQ-50-FM
```
