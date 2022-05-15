
# 10. Instalación

```bash
sudo apt install ruby
```

# 11. Variables

```ruby
name = "Obiwan"
age = 42
siths = [ "Darth Vader", "Darth Sidious", "Darth Maul"]
```

# 12. Estructuras básicas

```ruby
if age < 18
  puts "Sorry! Too younger!"
end
```

```ruby
jedis = [ "Obiwan", "Yoda", "Quigon-Jinn"]

for jedi in jedis
  puts "Hello #{jedi}"
end
```

```ruby
def greet(name)
  puts "May the fourth, be with you #{name}!"
end
```

# 13. Ejecutar comandos del sistema

La instrucción `system` ejecuta un comando del sistema y devuelve `true/false`.

```ruby
ok = system("ping -c1 www.starwars.com")

unless ok
  puts "Starwars ERROR!"
end
```

La instrucción `%x()` o "comillas inclinadas", ejecuta un comando del sistema y devuelve su contenido.

```ruby
name = ENV['USER'] # Leer las variables de entorno
place = `pwd`

puts "#{name} is into #{place}"
```

# 14. Entrada al script

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
