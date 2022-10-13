
# Static method 

## How to implement a static method in ruby class?

Do you think if my following code is correct for implementing a static
method (maybe singleton, or class method) in ruby class?

```ruby
class Foo
   @@x = 0

   def self.count
     @@x += 1
     @@x
   end
end

puts Foo.count
puts Foo.count
puts Foo.count
```

The run results:

```
$ ruby t1.rb
1
2
3
```


I want a method like this one in scala code.

```scala
object Foo {
   var int = 0
   def increase = { int += 1; int }
}

println(Foo.increase)
println(Foo.increase)
println(Foo.increase)
```

## Solution

Avoid using class variables. They don’t quite work the way you think they do. They still have their place, but it’s exceedingly rare.

Prefer instance variables, remembering that classes are instances, too.

```ruby
class Foo
  def self.count
    @count ||= 0
    @count += 1
  end
end
```

