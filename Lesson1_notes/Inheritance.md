<h1>Inheritance</h1>

**Inheritance** is when a class **inherits** a behavior from antoher class

The class that is inheriting the behavior is the **subclass** 
and the class it is inheriting from is the **superclass**

```Ruby 
class Animal
  def speak
   "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
stuart = Cat.new

puts sparky.speak # => "Hello"
puts stuart.speak # => "Hello"
```

The `<` method means we are inheriting from a class

This means that all of the methods in the `Animal` class are available for the `GoodDog` and `Cat` classes.

So what is happening below?

```Ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!
```

When we defined `speak` in the `GoodDog` class, we are overriding the `speak` method in the `Animal` class

<h1>super</h1>

`super` allows us to call methods up the inheritance hierarchy

When you call `super` from within a method, it will search the inheritance hierarchy for a method
with the same name and invoke it.

```Ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```

In the example above, we created an `Animal` class with a simple instance method called `speak`

The class `GoodDog` was then created which is a subclass of `Animal` and it has a `speak`
instance method to override the inherited version.

However within the subclass `speak` method we use `super` to invoke the method from the superclass, `Animal`.

We also extended functionality by adding more text.

What is the output of the last line below?

```Ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  attr_accessor :color
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")

puts bruno.name # => "brown"
```

Surprised?  The output is "brown" because in this example the `initialize` method
takes an argument and adds a new twist to how the `super` is invoked.  `super` automatically
forwards the arguments that were passed to the method from which `super` is called (`initialize`
method in `GoodDog` class).

super will pass the color in the argument in the `initialize` method defined in the subclass
to that of the `Animal` superclass and invoke it.

That explains the presence of `@name = "brown"` when the `bruno` instance is created.
Finally the subclass's initialize continues to set teh `@color` instance variable.

**Solution**

When called with specific arguments e.g. super(a,b), the specified arguments will be sent up 
the method lookup chain.

```Ruby
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear") # => @age= 2 @name= "bear"
```
`super` takes an argument, so the argument is passed in the superclass

