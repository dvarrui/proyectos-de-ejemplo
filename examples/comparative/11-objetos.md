[<< back](README.md)

# Objetos

En Java todo son objetos, Python todo son objetos, en Ruby todo son objetos.

```ruby
class Person
  @rol = "jedi"

  def initialize(name)
    @name = name
  end

  def to_s
    "name=#{@name}, rol=#{@rol}"
  end
end

yoda = Person.new("yoda")
vader = Person.new("vader")

puts "yoda  : #{yoda}"
puts "vader : #{vader}"

# Se obtiene siguiente salida:
# => yoda  : name=yoda, rol=
# => vader : name=vader, rol=
```

`@rol` no es un atributo de las instancias de la clase Person.

Se que esto puede confundir a un no "rubydev", pero Person es la clase de la instancia `yoda`, y `@rol` está definido como atributo de instancia `Person`. ¡Si! **Las clases son objetos en Ruby**. ¡Todo es un objeto!.

Person es una instancia de la clase Class. Y Class es una instancia de las clase Class. Y ya paremos. Es como el type de Python.

```ruby
>> yoda = Person.new("yoda")
=> #<Person:0x00007fb08dec5190>
>> yoda.class
=> Person

>> Person.class
=> Class

>> Class.class
=> Class
>>

>> yoda.instance_variables
=> [:@name]

>> Person.instance_variables
=> [:@rol]
```
