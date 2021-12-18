
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


=============================
Herramienta de testeo automático
https://github.com/sdelquin/pyceu

=============================
Clean Code 29
La regla del Boy Scout
Dejar el campamento más limpio de lo que se ha encontrado [5] .

* Nombres con sentido: Usar nombres que revelen las intenciones
Debe indicar por qué existe, qué hace y cómo se usa. Si un nombre requiere un
comentario, significa que no revela su cometido.
