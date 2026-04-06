[<< back](./README.md)

1. [Modelo cognitivo](./01-modelo.md)
2. [Características](./02-features.md)
3. [Distancia cognitiva](./03-distancia.md)
4. [DSL - Domain Specific Languages]


Precisamente porque ese "match" es tan deseable, la industria creó los Lenguajes de Dominio Específico. Son lenguajes con un modelo cognitivo extremadamente estrecho pero perfecto para un nicho.

    Regex (Expresiones Regulares): Solo para buscar patrones en texto.

    YAML / JSON: Solo para representar datos jerárquicos.

    Terraform: Solo para describir infraestructura de servidores.

    Reflexión: Un programador senior no es el que sabe más sintaxis, sino el que sabe identificar qué modelo cognitivo requiere el problema actual y elige la herramienta que tenga la menor distancia posible.

Bajo esta lógica, ¿crees que es mejor ser un "especialista" en un solo lenguaje potente (como Rust o Java) o ser un "políglota" que cambia de modelo según el problema?
Has dicho

Entiendo que cada lenguaje de programación tiene su propio modelo cognitivo. Cada uno es correcto desde su propio punto de vista. No son comparables.


Pero hay modelos cognitivos que están mejor diseñados que otros. Hay modelos con mad incongruencias que otros. Cuando un lenguaje infringe sus principios de diseño base tiene incongruencias serias y debe descartarse para su uso
Gemini ha dicho

Esa es una postura muy arquitectónica y, para ser honestos, muy necesaria. En el diseño de lenguajes, la coherencia no es solo un capricho estético; es lo que permite que un programador pueda "predecir" el comportamiento del lenguaje sin tener que consultar la documentación cada cinco minutos.

Cuando un lenguaje viola sus propios principios, rompe el Modelo Mental que el programador ha construido. A esto se le conoce técnicamente como falta de ortogonalidad.
1. El Ideal: Ortogonalidad y Consistencia

Un lenguaje es "ortogonal" cuando sus reglas son independientes y no tienen excepciones extrañas al combinarse.

    Si el lenguaje dice: "Todo es un objeto".

    Y luego dice: "Bueno, excepto estos 8 tipos primitivos que se comportan distinto por razones de rendimiento".

    Resultado: El modelo cognitivo se fractura. Tienes que memorizar casos especiales en lugar de aplicar una lógica universal.

2. Los "Pecados" de Diseño: Incongruencias Graves

Hay lenguajes que son famosos por haber sobrevivido a pesar de sus contradicciones internas, pero que desde un punto de vista purista, son "modelos fallidos":
Lenguaje	El Principio que Rompe	La Incongruencia (El "WTF")
JavaScript (clásico)	Coherencia de tipos.	[] == ![] es true. El modelo de coerción de tipos es tan inconsistente que obliga a usar herramientas externas (Linters) para evitar partes del lenguaje.
PHP (antiguo)	Predictibilidad de APIs.	El orden de los parámetros en las funciones de manejo de strings (haystack, needle) es distinto al de los arrays. No hay un patrón, solo memoria bruta.
C++	Simplicidad y seguridad.	Su modelo cognitivo es tan vasto y permite tantas formas de hacer lo mismo (algunas peligrosas) que es casi imposible que dos programadores tengan el mismo modelo mental del lenguaje.
3. ¿Por qué no los descartamos todos?

Aquí es donde entra la tensión entre elegancia y pragmatismo. Tienes razón en que, teóricamente, un lenguaje con incongruencias serias debería descartarse. Sin embargo, en el mundo real, los lenguajes suelen sobrevivir por tres razones que "perdonan" su mal diseño:

    Efecto de Red (Ecosistema): Si todos usan una herramienta rota, la herramienta sigue siendo valiosa porque hay bibliotecas, foros y trabajo para ella.

    El Principio de "Worse is Better": A veces, un modelo cognitivo simple pero "sucio" (fácil de implementar y usar rápido) gana a un modelo elegante pero complejo (difícil de aprender o implementar).

    Evolución Biológica: Los lenguajes no se diseñan en un laboratorio vacío; crecen como ciudades. Se añaden parches sobre parches para no romper el código antiguo, lo que genera esas incongruencias que mencionas.

4. Los lenguajes de "Nueva Generación"

Hoy vemos una rebelión contra esos modelos inconsistentes. Lenguajes como Rust, Go o Zig intentan volver a la pureza del diseño:

    Rust: Tiene un modelo cognitivo estricto (Ownership). Si lo violas, el código no compila. Es frustrante al principio, pero es totalmente coherente.

    Elm: En el mundo del frontend, es famoso por ser "perfecto". Si compila, funciona. No tiene excepciones a sus reglas.

    Cita para reflexionar: "Hay dos tipos de lenguajes de programación: aquellos de los que la gente se queja y aquellos que nadie usa." — Bjarne Stroustrup (creador de C++).

¿Crees que el futuro del software pertenece a los lenguajes "puros" que nos obligan a pensar correctamente, o seguiremos usando lenguajes "caóticos" simplemente porque son más flexibles para el caos del día a día?
Has dicho

Si. Dime si conoces incongruencias de ruby y de python
Gemini ha dicho

Tocar el diseño de Python y Ruby es entrar en el terreno de dos filosofías opuestas. Ambos son lenguajes "amigables", pero sus incongruencias nacen precisamente de los atajos que tomaron para lograr esa amabilidad.

Aquí tienes las fracturas en sus modelos cognitivos:
1. Python: "Debería haber una sola forma obvia" (Pero no)

El mantra de Python es el Zen de Python: "Explicit is better than implicit" y "There should be one—and preferably only one—obvious way to do it". Sin embargo, el lenguaje tiene "arrugas" históricas:

    ¿Función o Método? (len() vs .upper()): Esta es la incongruencia más famosa. Para saber la longitud de una lista, haces len(lista) (función global). Pero para convertir un texto a mayúsculas, haces texto.upper() (método de objeto). Si el modelo es orientado a objetos, ¿por qué len no es un método? La explicación oficial es por rendimiento y "legibilidad", pero rompe la consistencia del modelo de objetos.

    El argumento predeterminado mutable: Si defines def mi_funcion(lista=[]), esa lista se crea una sola vez cuando se define la función, no cada vez que se llama. Si modificas la lista, la siguiente llamada tendrá los datos de la anterior. Es un comportamiento que atrapa a todos los principiantes y viola la intuición de "estado fresco".

    Scoping (Ámbito de variables):
    En Python, un bucle for no crea un nuevo ámbito. Si declaras for i in range(10), la variable i sigue viva fuera del bucle. Sin embargo, en las funciones sí hay un ámbito nuevo. Esta inconsistencia obliga al cerebro a llevar un mapa de "dónde sobrevive qué".

    El "Self" explícito: Python presume de ser limpio, pero te obliga a escribir self como primer argumento en cada método de una clase. Es un detalle de implementación que se filtró al modelo cognitivo del programador.

2. Ruby: "Felicidad del programador" (A costa de la predictibilidad)

El modelo de Ruby es "Todo es un objeto" y el "Principio de la Menor Sorpresa" (POLA). El problema es que lo que no sorprende a su creador (Matz), a veces confunde al resto.

    La guerra de los cierres (Blocks vs. Procs vs. Lambdas): Ruby tiene tres formas (mínimo) de manejar fragmentos de código reutilizables. Cada una se comporta de forma ligeramente distinta respecto al comando return.

        Un return dentro de un Block rompe la función que lo contiene.

        Un return en un Lambda solo sale del lambda.
        Esto crea una carga cognitiva alta: tienes que recordar qué tipo de caja estás usando para saber cómo afectará al flujo del programa.

    Ambigüedad Sintáctica: Ruby permite omitir paréntesis en casi cualquier lugar. metodo a, b es válido. Pero cuando empiezas a encadenar, el intérprete a veces no sabe si a es una variable o un método sin argumentos. El lenguaje sacrifica la claridad estructural por una estética de "lenguaje natural".

    alias vs alias_method: Existen dos formas de renombrar métodos. Una es una palabra clave del lenguaje y la otra es un método de la clase Module. Tienen reglas de alcance (scope) distintas. Es una redundancia que ensucia el modelo "puro" de objetos.

    Monkey Patching (Peligro oculto): El modelo cognitivo de Ruby te permite abrir cualquier clase (incluso las del sistema como String) y cambiar su comportamiento en tiempo de ejecución. Esto es poderoso, pero rompe el Razonamiento Local: no puedes estar seguro de qué hace "hola".upper porque alguna librería externa pudo haber redefinido ese método globalmente.

Cuadro Comparativo de Incongruencias
Característica	Incongruencia en Python	Incongruencia en Ruby
Principio Violado	"Solo una forma obvia".	"Mínima sorpresa / Consistencia".
Punto Débil	Mezcla de estilo funcional y OO (len(x) vs x.method()).	Exceso de formas de hacer lo mismo (TIMTOWTDI).
Consecuencia	Errores sutiles en el manejo de estados (mutables).	Código difícil de seguir en proyectos grandes (magia oculta).
Conclusión Técnica

Si aplicamos tu criterio de que "un lenguaje que infringe sus principios debe descartarse", tendríamos un problema serio: casi no quedarían lenguajes para trabajar. La mayoría de estas incongruencias son "deuda técnica" del diseño original. Python prefirió ser pragmático para atraer a científicos, y Ruby prefirió ser expresivo para atraer a creativos.

¿Crees que estas fallas son lo suficientemente graves como para preferir lenguajes más rígidos pero consistentes como Rust o Smalltalk (el padre de la orientación a objetos pura)?
Has dicho

Las incongruencias de ruby que mencionas. No lo son.

Estamos hablando de principios de diseño base del lenguaje que se incumplen. O de excepciones que rompen la norma. Si es que hay alguna.
Gemini ha dicho

Tienes toda la razón. He caído en la trampa de listar "puntos de fricción" o dificultades de aprendizaje en lugar de violaciones estructurales de los axiomas del lenguaje.

Si nos ponemos rigurosos con la teoría de lenguajes, una incongruencia es una ruptura del contrato fundamental del modelo cognitivo. Vamos a filtrar el ruido y buscar donde estos lenguajes realmente "mienten" respecto a sus propios cimientos.
1. El caso de Ruby: ¿Es realmente consistente?

El modelo cognitivo de Ruby es: "Todo es un objeto y todo mensaje devuelve un objeto". Es un modelo descendiente directo de Smalltalk. Bajo este prisma, las libertades sintácticas (paréntesis opcionales) no son incongruencias, son solo azúcar sintáctico.

Sin embargo, hay una ruptura técnica con su axioma "Todo es un objeto":

    Los Bloques: En Ruby, un bloque ({ ... } o do...end) no es un objeto. Es una estructura sintáctica especial. No puedes asignar un bloque a una variable ni pasarlo como argumento sin antes transformarlo en un objeto de la clase Proc (usando el símbolo &).

        Incongruencia: Si el modelo dice "Todo es un objeto", el hecho de que la herramienta más usada del lenguaje (el bloque) no lo sea, es una excepción que rompe el principio de diseño base. Es una "entidad de segunda clase" en un mundo de ciudadanos de primera.

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

3. ¿Cuándo se debe descartar un lenguaje?

Siguiendo tu premisa: "Cuando un lenguaje infringe sus principios de diseño base... debe descartarse".

Si aplicamos este rigor:

    JavaScript debería ser el primero en caer: su modelo de "Prototipos" es ignorado por su propia sintaxis de class (que es una farsa semántica) y su igualdad no es transitiva.

    Python se salva por "pragmatismo", pero su modelo cognitivo es, en realidad, un conjunto de reglas con muchas notas al pie de página.

    Ruby es quizás de los más honestos, excepto por esa distinción técnica entre bloque y objeto.

El problema real: Casi todos los lenguajes industriales son "híbridos" que han sacrificado la pureza del modelo cognitivo para ganar rendimiento o adopción masiva.

¿Conoces algún lenguaje que consideres totalmente libre de incongruencias? (Muchos apuntan a Smalltalk o Lisp como los únicos que se mantienen 100% fieles a su axioma inicial).
Has dicho

No entiendo la incongruencias de ruby con los bloques. Los bloques se pueden pasar a una variable y son un objeto proc.
Gemini ha dicho

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


