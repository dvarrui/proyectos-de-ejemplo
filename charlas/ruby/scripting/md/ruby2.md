
# 7. Empresas

```
[2013] Visita a la central de OpenSUSE en Nürenberg
```

Lenguajes de scripting:
* **Ruby**
* Python
* Perl

Herramientas:
* Yast, Vagrant, Metasploit, Rails(GitHub, Shopify), etc.

# 8. The Urban Penguin

* Andrew Mallett (@theurbanpenguin): Ruby Scripting in Linux - See our mini-series of video tutorials!
    * http://ow.ly/BYIi30nifgZ
    * https://www.theurbanpenguin.com/scripting-power-repetition/ruby-scripting-linux/

```
Pero entonces... ¿qué es y qué no es scripting?
```

# 9. Definir scripting

```
Al no encontrar consenso con los compañeros... creo mi propia definición personal
```

* Lenguaje interpretado.
* No se requiere IDE. Basta un editor texto plano.
* Script => Ejecutar comandos del sistema + estructuras de control.
* Comandos: Programas sin entorno gráfico.

```
Scripting = comandos del sistema + "algo que los una de forma lógica"
```

* Nuestro objetivo es automatizar.
* Sólo mostrar mensajes cuando hay problemas.
* Códigos de salida: `0 = OK`, `1 = Error`

# 10. Instalación

```bash
sudo apt install ruby
```

* MacOS y OpenSUSE ya lo tienen preinstalado.

# 11. Variables

Ejemplos variables String, Integer y Array:

```ruby
name = "Obiwan"
age = 42
siths = [ "Darth Vader", "Darth Sidious", "Darth Maul"]
```

* Tipado fuerte y dinámico igual que Bash.

# 12. Estructuras condicional

Estructura condicional:

```ruby
if age < 18
  puts "Sorry! Too younger!"
end
```

* Los parént
```
if (age < 18)
  puts "Sorry! Too younger!"
end
```

```
if (age < 18) then
  puts "Sorry! Too younger!"
end

```

# 13. Los iteradores

```ruby
jedis = [ "Obiwan", "Yoda", "Quigon-Jinn"]

for jedi in jedis
  puts "Hello #{jedi}"
end

# Hay muchos más iteradores pero con este será suficiente por ahora
```

# 14. Métodos y funciones:

```ruby
def greet(name)
  puts "May the fourth, be with you #{name}!"
end
```

```ruby
def am_i_root?
  username = `whoami`.chomp
  return true if username == 'root'

  return false
end
```

# 14. Ejecutar comandos

La instrucción `system` ejecuta un comando del sistema y devuelve `true/false`.

```ruby
ok = system("ping -c1 www.starwars.com")

unless ok
  puts "Starwars ERROR!"
end
```

# 15. Ejecutar comandos para lectura

La instrucción `%x()` o "comillas inclinadas", ejecuta un comando del sistema y devuelve su contenido.

```ruby
name = ENV['USER'] # Leer las variables de entorno
place = `pwd`

puts "#{name} is into #{place}"
```

# 16. Entrada al script

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
