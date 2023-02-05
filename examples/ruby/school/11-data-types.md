
# Ruby data types

Strictly speaking, there are no data types in Ruby. There are only objects. But let's talk a bit about the types of objects associated with the data types of other programming languages.

## Built-in objects used as data types

In programming, data type is an important concept. Variables can store data of different types, and different types can do different things.

* Text Type: 	String
* Numeric Types: 	Integer, Float, Complex
* Sequence Types: Array, Range
* Mapping Type: Hash
* Set Types: Set
* Boolean Types: true, false
* None Type: nil

## Getting the Data Type

You can get the class (data type) of any object by using the `class` method:

Print the class of the variable a:

```ruby
a = 6
puts a.class
```

## Setting the Data Type

In Ruby, the data type is set when you assign a value to a variable:

| Example     | Data Type |
| ----------- | --------- |
| s = "Hello" | String  |
| s = :world  | Symbol  |
| n = 16      | Integer |
| n = 6.5     |	Float   |
| n = 3+i 	  | Complex | 	
| a = [1, 2, 3] | Array | 	
| a = 1..6      | Range |
| a = { name: "Obiwan", age: 52} | Hash |
| u = nil     | Nil |
| b = true    | TrueClass |
| b = false   | FalseClass |


**About booleans (true/false)**

```ruby
t = true
t.class #=> TrueClass
t.class.ancestors
#=> [TrueClass, Object, PP::ObjectMixin, Kernel, BasicObject]

f = false
f.class #=> FalseClass
f.class.ancestors
#=> [FalseClass, Object, PP::ObjectMixin, Kernel, BasicObject]
```

Question:
* Why true is an instance of TrueClass and false an instance of FalseClass?
* Why not be instances of BooleanClass?

Response:
* The reason that the Boolean class does not exist is that True and False do not share methods and therefore it does not make sense to inherit from the same parent class.
* Although True and False have a common interface, they do not share code.

## Convert to another class

If you want to convert to another class, you can use the following methods:

| Example        | Value   | Class  |
| -------------- | ------- | ------ |
| "Hello".to_sym | :hello  | Symbol |
| :world.to_s    | "world" | String |
| 2.3.to_i       | 2       | Integer |
| 5.to_f         | 5.0     | Float |
| 6.to_c         | (6+0i)  | Complex |
| (1..3).to_a    | [1,2,3] | Array |

Exercise:

The following code example would print the class of x, what class would that be?

```ruby
x = 5
puts x.class
```
