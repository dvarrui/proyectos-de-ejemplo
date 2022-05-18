
# 7. Definir scripting

Definición personal:
* Lenguaje interpretado.
* No se requiere IDE. Basta un editor texto plano.
* Script => Ejecutar comandos del sistema + estructuras de control.
* Comandos: Programas sin entorno gráfico.

```
[!] SCRIPTING = comandos_del_sistema() + "algo que los una de forma lógica"
```

Filosofía de los comandos y scripts:
* Automatizar/facilitar tareas.
* Sólo mostrar mensajes cuando hay problemas.
* Códigos de salida: `0 = OK`, `1 = Error`

# 8. Instalación de Ruby

![](images/instalacion.png)

* MacOS y OpenSUSE ya lo tienen preinstalado.

# 9. Variables

![](images/tipos-de-datos.png)

* Tipado fuerte y dinámico (igual que Bash).
* Lenguage interpretado (igual que Bash).

# 10. Estructuras condicional

Estructura condicional:

![](images/condicional.png)

* Los paréntesis y "then" son opcionales:

```
if (age < 18) then
  puts "Sorry! Too younger!"
end
```

# 11. Filosofía de Ruby

```
[ Principio 1 ] Buscar la felicidad del programador!
```

* Ruby está orientado a **"reducir" el tiempo del ser humano**.

```
[?] ¿Esto es muy subjetivo?... ¿Cómo lo hacemos en realidad?_
```

* **Principio de menor sorpresa**.
* Lenguaje, dinámico y flexible para dar **libertad al programador**.
* Ruby es **simple por fuera**, pero complejo por dentro.
* Importancia de parecerse al **lenguaje natural**.

![](images/rubylang.png)

# 12. Los iteradores

![](images/iterador-for.png)

Bucle clásico:

![](images/bucle-while.png)

```
[!] Hay muchas otras formas de hacer bucles e iterar...
```

# 13. Métodos y funciones:

Método

![](images/metodo.png)

La función es un método que devuelve un objeto.

![](images/funcion.png)

# 14. Ejecutar comandos

La instrucción `system` ejecuta un comando del sistema y devuelve `true/false`.

![](images/system.png)

# 15. Ejecutar comandos para lectura

La instrucción `%x()` o "comillas inclinadas" sirven para:
1. Ejecutar un comando del sistema y
2. guardar la salida en una variable.

```ruby
name = ENV['USER'] # Leer las variables de entorno
place = `pwd`

puts "#{name} is into #{place}"
```

# 18. Entrada al script

Paso de argumentos en el Array `ARGV`:

```ruby
puts "Hello #{ARGV[0]}!"

exit 0
```

Variables de entorno:

```ruby
name = ENV['user']
puts "My name is #{name}"

exit 0
```

De forma interactiva:

```ruby
print "¿Cómo te llamas? "
name = gets

puts "Hola #{name}!"
exit 0
```
