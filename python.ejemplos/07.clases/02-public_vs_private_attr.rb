class Person
  attr_reader :name # Create name method => return @name value

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
puts p.name # Defined as public reader attribut.
            # That's mean. Exist method Person.name => @name value.
puts p.age  # Raise exception. Attributes are private by default.
            # That's mean. Dosn't exist method Person.age.
