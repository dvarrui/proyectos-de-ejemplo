
# Ruby Syntax

## Execute Ruby Syntax

As we learned in the previous page, Python syntax can be executed by writing directly in the Interactive Ruby:

```
irb(main):001:0> puts("Hello world!")
Hello world!
=> nil
```

Or by creating a Ruby file, using the .rb file extension, and running it in the Command Line:

```
C:\Users\Your Name>ruby myfile.rb
```

## Parentheses in Ruby

Parentheses in Ruby

When a method is invoked, you type the method name and then put the function arguments in parentheses. Example: `puts("Hello World!")`

In Ruby, these parentheses can be omitted since the interpreter is able to understand what we want to write most of the time without the need for the parentheses. Example: `puts "Hello World!"`.

In Ruby it is preferred to write methods without the parentheses. This is usually strange to new programmers, but a writing closer to natural language is achieved.

## Ruby Variables

In Ruby, variables are created when you assign a value to it:

```ruby
x = 5
y = "Hello, World!"
```

Ruby has no command for declaring a variable.

You will learn more about variables in the [Ruby Variables](variables) chapter.

## Comments

Ruby has commenting capability for the purpose of in-code documentation.

Comments start with a #, and Ruby will render the rest of the line as a comment:

```ruby
# This is a comment.
puts("Hello, World!")
```

Exercise: _Insert the missing part of the code below to output "Hello World"._

```
    ("Hello World")
```
