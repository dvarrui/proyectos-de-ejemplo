class Dog
  def bark
    puts "Woof"
  end
end

foo = Dog.new()
foo.bark() # "Woof"

# replace bark instance method
class << foo
  def bark
    puts "Woof Woof"
  end
end

foo.bark() # "Woof Woof"
