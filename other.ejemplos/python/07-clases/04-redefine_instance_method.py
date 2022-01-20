class Dog:
    def bark(self):
        print "Woof"

def new_bark(self):
    print "Woof Woof"

foo = Dog()

funcType = type(Dog.bark)

# "Woof"
foo.bark()

# replace bark with new_bark for this object only
foo.bark = funcType(new_bark, foo, Dog)

foo.bark()
# "Woof Woof"
