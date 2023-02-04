[<<back](README.md)

# Variable Names

A variable can have a short name (like x and y) or a more descriptive name (age, carname, total_volume). Rules for Ruby variables:

* A variable name must start with a letter or the underscore character
* A variable name cannot start with a number
* A variable name can only contain Ruby operators (!, |, @, #. $ %, &, /, parenthesis, brakets, =, ?A-z, 0-9, and _ )
    Variable names are case-sensitive (age, Age and AGE are three different variables)

Legal variable names:

```ruby
aª = 1
bº = 2
c¿ = 3
d¡ = 4
¨e = 5
fÇ = 6

myvar = "John"
my_var = "John"
_my_var = "John"
myVar = "John"
MYVAR = "John"
myvar2 = "John"
```

Illegal variable names:

```ruby
2myvar = "John"
my-var = "John"
my var = "John"
```

Remember that variable names are case-sensitive

## Multi Words Variable Names

Variable names with more than one word can be difficult to read. There are several techniques you can use to make them more readable:

* _Camel Case_. Each word, except the first, starts with a capital letter: `myVariableName = "John"`. Not used in Ruby.
* _Pascal Case_. Each word starts with a capital letter: `MyVariableName = "John"`. Used to names constant variables, classes or modules.
* **Snake Case**. Each word is separated by an underscore character: `my_variable_name = "John"`. Recommended style to name variables in Ruby.
