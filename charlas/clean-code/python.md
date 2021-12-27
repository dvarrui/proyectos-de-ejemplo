

GitHub - uohzxela/clean-code-ruby: 🛁 Clean Code concepts adapted for Ruby
https://github.com/uohzxela/clean-code-ruby


========================
BASIC a Pascal
Número de líneas y goto
legibilidad


http://old8bits.blogspot.com/2012/03/introduccion-la-programacion-en-basic-i.html

10 REM Este es un ejemplo de Hola Mundo en BASIC
20 CLS
30 PRINT “Hola mundo”
40 END

NO declaración de variables.


var
  dividendo, divisor: integer;

begin
    write('Dime el dividendo: ');
    readln(dividendo);
    write('Dime el divisor: ');
    readln(divisor);

    while divisor = 0 do
    begin
        write('No debe ser 0. Dimelo otra vez: ');
        readln(divisor);
    end;

    writeLn('La división es ', dividendo / divisor);
    readln;
end.


for i in marks...
for mark in marks...

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
dvarrui, [17.12.21 19:45]
Entiendo que para java poo es más importante que procedural y funcional porque todo se hace sobre poo clases y objetos.

En python se puede programar sin poo ni funcional por tanto será procedural.

En elixir la base son las funciones... funcional.

Estuve hablando con Sergio y entiendo que en python en principalmente procedural. Porque si quieres no tienes que hacer objetos ni hacer nada funcional pero procedural si. Al contrario java es principalmente POO porque hagas lo que hagas siempre tienes que hacer una clase. verdad?

========================
Juan Ignacio
si, mas o menos

Python no te obliga a nada en principio, esa es la idea
si quieres procedimental, procedimental
si quieres  OOP lo mismo
si quieres funcional ... casi, no es tan potente como un lenguaje funcional puro, pero se va acercando


print('¿Y la familia?', end='')
print(' -Bien, gracias.')

print('¿Y la familia?', end='')
puts(' -Bien, gracias.')

=============================
Herramienta de testeo automático
https://github.com/sdelquin/pyceu

=============================

Una diferencia entre un programador inteligente y un programador profesional es
que este último sabe que la claridad es lo que importa. Los profesionales usan sus poderes para hacer el bien y crean código que otros puedan entender.


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
