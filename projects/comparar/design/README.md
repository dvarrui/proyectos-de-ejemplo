[<< back](./README.md)

1. [Modelo cognitivo](./01-modelo.md)
2. [Características](./02-features.md)
3. [Distancia cognitiva](./03-distancia.md)
4. [DSL - Domain Specific Languages](./04-dsl.md)
5. [Incongruencias](./05-pecados.md)
6. [Razones para mantenerlos](./06-razones.md)

Cuadro Comparativo de Incongruencias
Característica	Incongruencia en Python	Incongruencia en Ruby
Principio Violado	"Solo una forma obvia".	"Mínima sorpresa / Consistencia".
Punto Débil	Mezcla de estilo funcional y OO (len(x) vs x.method()).	Exceso de formas de hacer lo mismo (TIMTOWTDI).
Consecuencia	Errores sutiles en el manejo de estados (mutables).	Código difícil de seguir en proyectos grandes (magia oculta).
Conclusión Técnica
---

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


