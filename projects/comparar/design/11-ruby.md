[<< back](./README.md)

# Ruby

```
Incongruencias del modelo congnitivo en el lenguaje
```

2. Ruby: "Felicidad del programador" (A costa de la predictibilidad)

El modelo de Ruby es "Todo es un objeto" y el "Principio de la Menor Sorpresa" (POLA). El problema es que lo que no sorprende a su creador (Matz), a veces confunde al resto.

    La guerra de los cierres (Blocks vs. Procs vs. Lambdas): Ruby tiene tres formas (mínimo) de manejar fragmentos de código reutilizables. Cada una se comporta de forma ligeramente distinta respecto al comando return.

        Un return dentro de un Block rompe la función que lo contiene.

        Un return en un Lambda solo sale del lambda.
        Esto crea una carga cognitiva alta: tienes que recordar qué tipo de caja estás usando para saber cómo afectará al flujo del programa.

    Ambigüedad Sintáctica: Ruby permite omitir paréntesis en casi cualquier lugar. metodo a, b es válido. Pero cuando empiezas a encadenar, el intérprete a veces no sabe si a es una variable o un método sin argumentos. El lenguaje sacrifica la claridad estructural por una estética de "lenguaje natural".

    alias vs alias_method: Existen dos formas de renombrar métodos. Una es una palabra clave del lenguaje y la otra es un método de la clase Module. Tienen reglas de alcance (scope) distintas. Es una redundancia que ensucia el modelo "puro" de objetos.

    Monkey Patching (Peligro oculto): El modelo cognitivo de Ruby te permite abrir cualquier clase (incluso las del sistema como String) y cambiar su comportamiento en tiempo de ejecución. Esto es poderoso, pero rompe el Razonamiento Local: no puedes estar seguro de qué hace "hola".upper porque alguna librería externa pudo haber redefinido ese método globalmente.

