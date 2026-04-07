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

---
Si aplicamos tu criterio de que "un lenguaje que infringe sus principios debe descartarse", tendríamos un problema serio: casi no quedarían lenguajes para trabajar. La mayoría de estas incongruencias son "deuda técnica" del diseño original. Python prefirió ser pragmático para atraer a científicos, y Ruby prefirió ser expresivo para atraer a creativos.


# Resumen

* Principio Violado: "Mínima sorpresa / Consistencia".
* Punto débil: Exceso de formas de hacer lo mismo (TIMTOWTDI).
* Consecuencias: Código difícil de seguir en proyectos grandes (magia oculta).

---
No entiendo la incongruencias de ruby con los bloques. Los bloques se pueden pasar a una variable y son un objeto proc.

Es una observación muy aguda, pero ahí es precisamente donde reside la sutil incongruencia técnica del modelo de Ruby. Para un programador que usa el lenguaje a diario, la distinción parece inexistente, pero si miramos el "ADN" del diseño, hay una ruptura de su principio fundamental.

Permíteme explicarte por qué, a nivel de diseño de lenguaje, el bloque es la única pieza que "no encaja" en el axioma "Todo es un objeto":
1. La distinción entre Bloque y Proc

Aunque Ruby te permite convertir uno en otro, no son lo mismo en el momento de su ejecución.

    El Bloque: Es una parte de la sintaxis del lenguaje (un trozo de código entre do..end). No tiene identidad propia, no tiene un object_id mientras es un bloque y no puede existir "flotando" por sí solo. Solo existe como un anexo a una llamada de método.

    El Proc: Es el objeto que envuelve esa lógica.

La Incongruencia:

Si el principio de Ruby es que "Todo es un objeto", el bloque es una excepción molesta. Es una entidad que puedes usar, pero que para ser "tratada como objeto" (asignarla a una variable), debe ser transformada.
Ruby

# Esto es un error de sintaxis:
mi_bloque = { puts "hola" } 

# Tienes que convertirlo explícitamente en objeto:
mi_proc = Proc.new { puts "hola" }

En un lenguaje realmente coherente con el principio de que "todo es un objeto" (como Smalltalk), el bloque ya es un objeto desde que lo escribes. En Ruby, el bloque es un ciudadano de segunda clase que necesita un "pasaporte" (Proc.new o el operador &) para convertirse en ciudadano de primera (Objeto).
2. El paso de mensajes (La violación del Modelo Mental)

Ruby se basa en el envío de mensajes a objetos. Sin embargo, los bloques se pasan de forma "mágica" por fuera de la lista de argumentos estándar.
Ruby

def metodo(a, b)
  yield if block_given?
end

metodo(1, 2) { puts "Soy un bloque" }

Aquí está la incongruencia de diseño:

    a y b son objetos pasados como argumentos (consistente).

    El bloque { puts ... } se pasa por un canal lateral implícito. No es un objeto en la lista de argumentos.

    Para acceder a él como objeto, el lenguaje tiene que hacer un trabajo extra (reificación) que consume recursos.

3. ¿Por qué esto es una "incongruencia"?

Porque obliga al programador a aprender dos conjuntos de reglas para una misma intención (ejecutar código):

    Regla A: Cómo se comportan los Objetos/Métodos (Argumentos, self, etc.).

    Regla B: Cómo se comportan los Bloques (yield, block_given?, el operador &, la diferencia entre break en un bloque y en un método).

Si el modelo fuera puro, solo necesitarías la Regla A. El hecho de que existan palabras clave específicas para los bloques (yield) demuestra que el modelo cognitivo de "Todo es un objeto" tiene un agujero justo en el centro de su característica más potente.
Resumen de la falta de "Match"

El modelo cognitivo de Ruby te dice: "No te preocupes, aquí todo es un objeto".
Pero cuando vas a usar la herramienta más común (los bloques), el lenguaje te susurra: "Espera, esto en realidad es una estructura sintáctica especial, si quieres que sea un objeto como los demás, ponle un & delante o usa lambda".

Ese "espera, esto es diferente" es, por definición, una incongruencia con el principio base.

¿Ves ahora la distinción técnica, o crees que al ser la conversión tan sencilla (&block), el lenguaje se "perdona" a sí mismo esa falta de pureza?

