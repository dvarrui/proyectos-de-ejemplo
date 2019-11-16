class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    puts("Hello! I'm #{@name}.")
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end
end

p = Person.new('Tomas', 44)
p.greet
puts p
