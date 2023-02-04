[<<back](README.md)

# Ruby - Global Variables

Global variables are variables named starting with $ symbol. Global variables can be used by everyone, both inside of methods and outside.

Create a variable outside of a method, and use it inside the method:

```ruby
$lang = "Ruby"

def mymethod
  puts "I love " + $lang
end

mymethod

# => I love Ruby
```

If you create a global variable with the same name inside a method, this global variable will be changed.

```ruby
$lang = "Ruby"

def mymethod
  $lang = "Rust"
  puts "I love " + $lang
end

mymethod
# => I love Rust

puts $lang
# => Rust
```

It is posible to create a global variable inside or outside a function.

```ruby
def mymethod
  $lang = "Ruby"
  puts "I love " + $lang
end

mymethod
# => I love Ruby

puts $lang
# => Ruby
```
