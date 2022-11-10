# Crear una clase en Ruby
class Person
  def initialize(name)
    @name = name
  end

  def speak
    puts "My name is #{@name}"
  end
end

yoda = Person.new('yoda')
yoda.speak
begin
  puts yoda.name
rescue => e
  puts "[INFO] name is private!"
end
