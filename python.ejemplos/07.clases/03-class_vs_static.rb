class Person
  @@country = 'Spain'

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end

  # Use class method when need access to Class state
  def self.imfrom
    puts("I'm from " + @@country)
  end

  # Use static method when dosn't need access to Class state
  def self.talk
    puts 'bla, bla, bla'
  end
end

Person.imfrom # class method. Not instance method.
              # Ruby may invoke class methods without instance
Person.talk   # class method. Not instance method.

# Python call this static method.
# Ruby static methods aren't defined into a Class.
# Ruby use modules to define methods out from Classes
module PersonTalking
  def self.talk
    puts 'bla, bla, bla from module'
  end
end

PersonTalking.talk
