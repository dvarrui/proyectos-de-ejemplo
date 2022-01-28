class Dog
  def bark
    puts "Woof"
  end
end

foo = Dog.new()
foo.bark() # "Woof"
# foo.singleton_methods => []

# replace bark instance method
class << foo
  def bark
    puts "Woof Woof"
  end
end

foo.bark() # "Woof Woof"
# foo.singleton_methods => [:bark]
