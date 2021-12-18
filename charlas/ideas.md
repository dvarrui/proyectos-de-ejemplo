
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
