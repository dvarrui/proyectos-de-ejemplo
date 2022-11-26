
Elixir:
```
a = "The quick brown fox jumps over the lazy dog"
String.length(a)
```

Ruby
```
a = "The quick brown fox jumps over the lazy dog"
a.length
```

Los átomos de Elixir son los símbolos de Ruby.

Elixir (Confuso!!!):
```
iex> 2 == 2.0
true
iex> 2 === 2.0
false
```

Ruby (más claro para el humano)
```
$ irb
irb(main):001:0> 2 == 2.0
=> true
irb(main):002:0> 2 === 2.0
=> true
irb(main):003:0
```

## String Concatenation

Elicir: String concatenation uses the <> operator:
```
iex> name = "Sean"
iex> "Hello " <> name
"Hello Sean"
```
NOOOOOOOOOOOO COnfuso!!!

Ruby mejor:
```
$ irb
irb(main):001:0> a ="Bond"
=> "Bond"
irb(main):002:0> "James " + a
=> "James Bond"
```

## List Concatenation

Elixir: List concatenation uses the ++/2 operator:
```
iex> [1, 2] ++ [3, 4, 1]
[1, 2, 3, 4, 1]
```

Ruby más natural:
```
irb(main):008:0> [1,2] + [3,4,1]
=> [1, 2, 3, 4, 1]
```

## List Subtraction

E: Support for subtraction is provided via the --/2 operator; it’s safe to subtract a missing value:
```
iex> ["foo", :bar, 42] -- [42, "bar"]
["foo", :bar]
```

R más natural!.
```
irb(main):011:0> ["foo", :bar, 42] - [42, "bar" ]
=> ["foo", :bar]
```

## List subtraction uses strict comparison to match the values.

E:For example:
```
iex> [2] -- [2.0]
[2]
iex> [2.0] -- [2.0]
[]
```

R
```
irb(main):012:0> [2] - [2.0]
=> [2]
irb(main):013:0> [2.0] - [2.0]
=> []
```

# Keyword lists

Keyword lists and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of two-element tuples whose first element is an atom; they share performance with lists:
```
iex> [foo: "bar", hello: "world"]
[foo: "bar", hello: "world"]
iex> [{:foo, "bar"}, {:hello, "world"}]
[foo: "bar", hello: "world"]
```

R más natural!
```
irb(main):014:0> [foo: "bar", hello: "world"]
=> [{:foo=>"bar", :hello=>"world"}]
irb(main):016:0> [{foo: "bar"}, {hello: "world"}]
=> [{:foo=>"bar"}, {:hello=>"world"}]
```
