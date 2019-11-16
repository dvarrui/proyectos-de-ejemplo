class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end

  def self.greet
    puts("Hello!")
  end
end

Person.greet # greet is class method. Not instance method.
