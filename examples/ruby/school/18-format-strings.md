[<<back](README.md)

# Ruby - Format - Strings

As we learned in the Ruby Variables chapter, we cannot combine strings and numbers like this:

```ruby
age = 36
txt = "My name is John, I am " + age
puts txt
```

But we can combine strings and numbers by using the % operator!
The % operator takes the passed values, and places them in the string where the placeholders %d are:

```ruby
age = 36
txt = "My name is John, and I am %d"
puts txt % age
```

The % operator takes unlimited number of arguments, and are placed into the respective placeholders:

```ruby
quantity = 3
itemname = "CD"
price = 49.95
myorder = "I want %d pieces of item %s for %f dollars."
puts myorder % [quantity, itemno, price]
```

You can use %<symbol>s to be sure the arguments are placed in the correct placeholders:

```Ruby
quantity = 3
itemname = "CD"
price = 49.95
myorder = "I want to pay %<a>f dollars for %<b>d pieces of item %<c>s."
print(myorder % [ a: price, b: quantity, c: itemname ]
```

Learn more about String Formatting in our String Formatting chapter.
