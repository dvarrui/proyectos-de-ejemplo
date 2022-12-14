[<< back](README.md)

# Las clases y objetos

En el paradigma POO debemos tener un mecanismo para definir "entidades" que encapsulen datos+métodos. Entendiendo por métodos, funcione que pueden acceder a los datos encapsulados dentro de la entidad.

Definir una entidad de este tipo se llama comúnmente una "clase". Ejemplo

```ruby
# Crear una clase en Ruby
class Person
  def initialize(name)
    @name = name
  end

  def speak
    puts "My name is #{@name}"
  end
end
```

```python
# Crear una clase en Python
class Person:
  def __init__(self, name):
    self.name = name

  def speak(self):
    print("My name is " + self.name)

```

IMHO, aunque Rust no tiene "clases", si tiene un mecanismo para crear entidades que encapsulan datos+métodos. Usando "structs+impl".

```
struct Person {
    name: String
}

impl Person {
    fn speak(self) {
        println!("My name is {:?}", self.name);
    }
}

fn main() {
    let name = String::from("Yoda");
    let yoda = Person { name };
    yoda.speak();
}
```

Person es un entidad con datos y métodos:
* Al crear una clase o un struct+impl estamos definiendo la entidad `Person`.
* Los objetos o variables tipo struct son las instancias de la entidad `Person`.
