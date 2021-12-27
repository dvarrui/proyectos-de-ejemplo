
========================
Clean COde pag 22

Big Dave comparte el deseo de legibilidad...
...el código limpio facilita las labores de mejora de otros.

Existe una diferencia entre el código fácil de leer y el código fácil de cambiar.

Dave vincula la limpieza a las pruebas. El código, sin pruebas, no es limpio.
Independientemente de su elegancia, legibilidad y accesibilidad, si no tiene
pruebas, no será limpio.

Clean Code 24

Dave usa dos veces la palabra mínimo. Valora el código de tamaño reducido, una
opinión habitual en la literatura de software desde su concepción. Cuanto más pequeño,
mejor.
También afirma que el código debe ser culto, una referencia indirecta a la
programación de Knuth [4] y que en definitiva indica que el código debe redactarse de una
forma legible para los humanos.
Michael Feathers, autor

Podría enumerar todas las cualidades del código limpio, pero hay una principal
que engloba a todas ellas. El código limpio siempre parece que ha sido escrito por alguien
a quien le importa. No hay nada evidente que hacer para mejorarlo. El autor del código
pensó en todos los aspectos posibles y si intentamos imaginar alguna mejora, volvemos al
punto de partida y sólo nos queda disfrutar del código que alguien a quien le importa
realmente nos ha proporcionado.

El código limpio es aquél al que se le ha dado
importancia. Alguien ha dedicado su tiempo para que sea sencillo y ha prestado atención a
los detalles. Se ha preocupado.
Ron Jeffries, autor de Extrem

También me fijo si un objeto o un
método hacen más de una cosa. Si se trata de un objeto, probablemente tenga que dividirse
en dos o más. Si se trata de un método, siempre recurro a la refactorización de extracción
de métodos para generar un método que exprese con mayor claridad su cometido y varios
métodos secundarios que expliquen cómo lo hace.

Sabemos que estamos trabajando con código limpio cuando cada rutina que leemos
resulta ser lo que esperábamos. Se puede denominar código atractivo cuando el código
hace que parezca que el lenguaje se ha creado para el problema en cuestión.

ación de Ward?
Ward espera que al leer código limpio no le sorprenda. De hecho, ni siquiera tendrá
que esforzarse. Lo leerá y será prácticamente lo que esperaba.

No es el lenguaje el que hace que los programas parezcan sencillos, sino el
programador que consigue que el lenguaje lo parezca.

Se hace una idea. En realidad, la proporción entre tiempo dedicado a leer frente a
tiempo dedicado a escribir es de más de 10:1. Constantemente tenemos que leer código
antiguo como parte del esfuerzo de crear código nuevo.

========================
Clean Code 29
La regla del Boy Scout
Dejar el campamento más limpio de lo que se ha encontrado [5] .

## 2. Nombres

Consejos
* Nombres con sentido: Usar nombres que revelen las intenciones
Debe indicar por qué existe, qué hace y cómo se usa. Si un nombre requiere un
comentario, significa que no revela su cometido.
* Evitar la desinformación: Los programadores deben evitar dejar pistas falsas que dificulten el significado del código. Debemos evitar palabras cuyo significado se aleje del que pretendemos.
* Realizar distinciones con sentido: Las palabras adicionales son otra distinción sin sentido. Imagine que tiene la clase
Product. Si tiene otra clase con el nombre ProductInfo o ProductData, habrá creado
nombres distintos, pero con el mismo significado. Info y Data son palabras adicionales, como a, an y the.
* Usar nombres que se puedan pronunciar
* Usar nombres que se puedan buscar: Personalmente prefiero nombres de una letra que sólo se puedan usar como variables locales dentro de métodos breves. La longitud de un nombre debe corresponderse al tamaño de su ámbito

Una diferencia entre un programador inteligente y un programador profesional es
que este último sabe que la claridad es lo que importa. Los profesionales usan sus poderes para hacer el bien y crean código que otros puedan entender.

* El nombre de una clase no debe ser un verbo. Los métodos deben tener nombres de verbo.
* Una palabra por concepto: Elija una palabra por cada concepto abstracto y manténgala. Por ejemplo, resulta confuso usar fetch, retrieve y get como métodos equivalentes de clases distintas. ¿Cómo va a recordar qué método se corresponde a cada clase?

En muchos casos no memorizamos los nombres de clases y métodos. Usamos
herramientas modernas para estos detalles y así poder centramos en si el código se lee
como frases o párrafos, o al menos como tablas y estructuras de datos (una frase no siempre es la mejor forma de mostrar datos).

Aplique estas reglas y compruebe si mejora o no la legibilidad de su código.

## 3 Funciones
* Tamaño reducido.
* Sangrado niveles 1 o 2.
* Hacer una cosa.

LAS FUNCIONES SÓLO DEBEN HACER UNA COSA. DEBEN HACERLO
BIEN Y DEBE SER LO ÚNICO QUE HAGAN.

Si una función sólo realiza los pasos situados un nivel por debajo del nombre de la
función, entonces hace una cosa.

Las funciones que hacen una sola cosa no se pueden dividir en secciones.

La mezcla de niveles de abstracción en una función siempre resulta confusa. Los
lectores no sabrán si una determinada expresión es un concepto esencial o un detalle. Peor todavía, si se mezclan detalles con conceptos esenciales, aumentarán los detalles dentro de la función.

* Leer código de arriba a abajo: la regla descendente
El objetivo es que el código se lea como un texto de arriba a abajo [14] . Queremos que tras todas las funciones aparezcan las del siguiente nivel de abstracción para poder leer el programa, descendiendo un nivel de abstracción por vez mientras leemos la lista de funciones. Es lo que denomino la regla descendente.

A los programadores les resulta complicado aprender esta regla y crear funciones en
un único nivel de abstracción, pero es un truco importante. Es la clave para reducir la longitud de las funciones y garantizar que sólo hagan una cosa. Al conseguir que el código se lea de arriba a abajo, se mantiene la coherencia de los niveles de abstracción

* Desafortunadamente, no siempre podemos evitar las instrucciones switch pero podemos aseguramos de incluirlas en una clase de nivel inferior y de no repetirlas. Para ello, evidentemente, recurrimos al polimorfismo.

La solución al problema (véase el Listado 3-5) consiste en ocultar la instrucción
switch en una factoría abstracta [18] e impedir que nadie la vea. La factoría usa la instrucción switch para crear las instancias adecuadas de los derivados de Employee y las distintas funciones, como calculatePay, isPayday y deliverPay, se entregarán de forma polimórfica a través de la interfaz Employee.

Recuerde el principio de Ward: «Sabemos que
trabajamos con código limpio cuando cada rutina es más o menos lo que esperábamos».
Para alcanzar este principio, gran parte del esfuerzo se basa en seleccionar nombres
adecuados para pequeñas funciones que hacen una cosa.

Cuanto más reducida y concreta
sea una función, más sencillo será elegir un nombre descriptivo.
