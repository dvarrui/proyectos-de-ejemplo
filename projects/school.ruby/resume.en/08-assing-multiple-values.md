[<<back](README.md)

# Ruby Variables - Assign Multiple Values

Ruby allows you to assign values to multiple variables in one line:

```ruby
a, b, c = 1, 2, 3
# a=1, b=2, c=3
```

When number of variables does not match the number of values, the remaining variables are initialized to nil or the remaining values are not assigned to any variables.

```ruby
a, b, c = 1, 2
# a=1, b=2, c=nil

a, b, c = 1, 2, 3, 4
# a=1, b=2, c=3
```

## One Value to Multiple Variables

And you can assign the same value to multiple variables in one line:

```ruby
a = b = c = 1
# a=1, b=1, c=1
```

## Unpack a Collection

If you have a collection of values. Ruby allows you to extract the values into variables. This is called unpacking.

```ruby
a, b, c = [1, 2, 3, 4]
# a=1, b=2, c=3

a, b, *c = [1, 2, 3, 4]
# a=1, b=2, c=[3,4]
```
