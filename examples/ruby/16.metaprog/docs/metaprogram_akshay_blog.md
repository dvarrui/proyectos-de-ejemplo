
[<< back](../README.md)

# Metaprogramming Ruby 2 (traducido al español)

> Enlaces de interés:
> * Metaprogramming in Ruby: https://www.akshaykhot.com/metaprogramming-ruby/
> * Akshay's Blog (https://www.akshaykhot.com/metaprogramming-ruby/)

```
Though it looks like magic, it’s still just programming.
This book will help you really understand the Rails source code.
```

La metaprogramación en Ruby nos permite crear programas elegantes, limpios y bonitos, así como código complejo e ilegible que no se puede mantener.

El principal beneficio que encontré de la metaprogramación no fue tanto escribir código inteligente, sino leer y comprender el código fuente abierto, especialmente el código fuente de Rails.

Rails hace un uso abundante de la metaprogramación. Tener el conocimiento de estos conceptos hace posible leer y comprender el código fuente para obtener una apreciación más profunda del marco de Rails y revelar su magia.

![](https://www.akshaykhot.com/content/images/2022/09/metaprogramming_ruby-1.jpeg)

## El modelo de objetos

Los objetos son ciudadanos de primera clase en Ruby. Los verás en todas partes. Sin embargo, los objetos son parte de un mundo más grande que también incluye otras construcciones del lenguaje, como clases, módulos y variables de instancia. Todas estas construcciones viven juntas en un sistema llamado modelo de objeto.

En la mayoría de los lenguajes de programación, las construcciones del lenguaje como variables, clases, métodos, etc. están presentes mientras programa, pero desaparecen antes de que se ejecute el programa. Se transforman en código de bytes (Java) o CIL (C#), o código de máquina simple (C). No se pueden modificar estas representaciones una vez que el programa ha sido compilado.

En Ruby, sin embargo, la mayoría de las construcciones del lenguaje todavía están ahí. Puedes hablar con ellos, consultarlos, manipularlos. Esto se llama introspección. Por ejemplo, el siguiente ejemplo crea una instancia de una clase y solicita sus variables de clase e instancia.

```ruby
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
end

ruby = Language.new("Ruby", "Matz")

pp ruby.class              # Language
pp ruby.instance_variables # [:@name, :@creator]
```

## Clases abiertas

Se puede abrir cualquier clase y agregarle nuevos métodos. Por ejemplo, abramos la clase String y agreguemos un nuevo método para iniciar sesión en ella.

```ruby
class String
  def log
    puts ">> #{self}"
  end
end

"Hello World".log	# >> Hello World
```

Esto se denomina [monkey-patching](https://en.wikipedia.org/wiki/Monkey_patch) y puede causar problemas si redefine los métodos existentes sin querer. Sin embargo, si sabe lo que está haciendo, monkey-patching puede ser muy poderoso. Por ejemplo, la gema ActiveSupport en Rails hace un uso intensivo de monkey-patching para abrir las clases principales de Ruby y definir nuevas funciones en ellas.

## Variables de instancia frente a métodos de instancia

Las variables de instancia de un objeto viven en el objeto mismo, y los métodos de un objeto viven en la clase del objeto.

![](https://www.akshaykhot.com/content/images/size/w1000/2022/09/instance.png)

Por esa razón los objetos de la misma clase comparten métodos pero no comparten variables de instancia.

## Las clases son objetos

Todo lo que se aplica a los objetos también se aplica a las clases. Cada clase es también un módulo con tres métodos de instancia adicionales: `new`, `allocate`, y `superclass`.

```ruby
class MyClass
  def my_method
    @v = 1
  end
end

puts MyClass.class        # Class
puts MyClass.superclass   # Object
puts Class.superclass     # Module
puts Object.class         # Class
puts Object.superclass    # BasicObject
pp BasicObject.superclass # nil
```

## ¿Qué sucede cuando se llama a un método?

Cuando se llama a un método, Ruby hace lo siguiente:

1. Encuentra el método mediante _method lookup_. Para esto, el intérprete de Ruby analiza la clase receptora, incluida la cadena de antepasados.
2. Ejecuta el método usando `self`.

El receptor es el objeto sobre el que se llama a un método, por ejemplo, en la sentencia `myObj.perform()`, `myObj` es el receptor.

La cadena de ancestros es la ruta de las clases desde una clase a su superclase, hasta llegar a la raíz, es decir, `BasicObject`.

![](https://www.akshaykhot.com/content/images/2022/09/inheritance-chain.jpeg)

## El Kernel

La clase `Object` incluye el módulo `Kernel`. Por tanto, los métodos definidos en `Kernel` están disponibles para todos los objetos. Además, cada línea en Ruby se ejecuta dentro de un objeto principal. Por lo tanto, se pueden llamar a los métodos de `Kernel`, como `puts`, desde cualquier lugar.

Si agrega un método a `Kernel`, estará disponible para todos los objetos y puede llamarse desde cualquier lugar.

```ruby
module Kernel
  def log(input)
    puts "Logging `#{input}` from #{self.inspect}"
  end
end

# Logging `hello` from main
log "hello"

# Logging `a` from "hello"
"hello".log("a")

# Logging `temp` from String
String.log("temp")
```
