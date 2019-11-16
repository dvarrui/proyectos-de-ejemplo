class Person
  def initialize(name)
    @name = name
    hidden
  end

  private
  def hidden
    puts('bla, bla, bla')
  end
end

p = Person.new('Invisible Man')
p.hidden # Error
