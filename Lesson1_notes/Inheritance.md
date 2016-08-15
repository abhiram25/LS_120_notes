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

<h1>Mixing in Modules</h1>

Another way to DRY up your code in Ruby is to use **modules**

Extracting common methods to a superclass is a great way to model concepts that are hierarchical.

Let's say we have a superclass called `Animal` that has all basic behavior
of all animals.  We can expand the model a little and have `Mammal` subclass
of `Animal`.

Let's say we have another subclass of `Animal` called `Fish`

In the `Mammal` class we can say they are warm blooded, so we create a method
called `warm_blooded?`  

In the `Fish` class, we can say they can swim.

There is some Animals that aren't fish that can swim, so what can we do?

This is a perfect time to use **modules**

```Ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable # mixing in Swimmable module
end
```
```Ruby
sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim # => I'm swimming!
neemo.swim  # => I'm swimming!
paws.swim   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
```

As you can see above, the `Fish` and `Dog` objects are able to swim, while
other objects can't.

Choosing between **Modules** and **Inheritance**

You can only subclass from one class, but you can mix in as many modules
as you'd like

- If it's a "is-a" relationship, choose inheritance.  
- If it's a "has-a" relationship, choose modules.

Modules are used only for namespacing and grouping common methods together.

<h1>Method Lookup Path</h1>

```Ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```

We have mixed in one module in the `Animal` class 

If we use the `ancestors` method, The output will be 

```Ruby
puts "---Animal method lookup---"
puts Animal.ancestors

---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
```

In the example above, first Ruby looks at the `Animal` class then it looks at the `Walkable` module, then the `object` class, then the `Kernel` module and then finally the `BasicObject` class.

```Ruby
fido = Animal.new
fido.speak # => I'm an animal, and I speak!
```

In the example above, Ruby found the `speak` method in the Animal class, so we don't have to look any further.

```Ruby
fido.walk # => I'm walking.
```

In the example above, Ruby looked for the `walk` method in the `Animal` class and then looked for the method in the `Walkable` module

It saw `walk` in there, executed it, and stopped looking further.

What's happening in this one?

```Ruby
fido.swim # => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>
```

Ruby looked for the `swim` method in all the classes and modules and couldn't find it, so it threw an error.

Let's add another class to the code above

```Ruby
class GoodDog < Animal
	include Swimmable
	include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors
```

```Ruby
---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```

As you can see from the output, `Climbable` is the first module we see.  Ruby looks at the last module
we included first.

<h1>More Modules</h1>

Let's talk about **namespacing**

**namespacing** is organizing similar classes under a module.  We will use modules to group related classes.  
It becomes easy for us to recognize related classes in our code. 

The second advantage to this is that it reduces the likelihood of our classes 
colliding with other similarly named classes in our codebase.

```Ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

```Ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

We call classes in a module by appending the class name to the module name with two colons `::`
```Ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"
```

The second use case for modules is a container for methods, called **module methods**

This involves using modules to house other methods.

Defining methods this way within a module means that we can call them directly from the module.

```Ruby 
value = Mammal.some_out_of_place_method(4)
```
OR
```Ruby
value = Mammal::some_out_of_place_method(4)
```

```Ruby
module Operations
  def self.add(a,b)
    a + b
  end

  def self.multiply(a,b)
    a * b
  end

  def self.divide(a, b)
    a / b
  end

  def self.subtract(a, b)
    a - b
  end
end

value_one = Operations.add(4,7)

puts value_one => 11
```

In the example above, we created a module called `Operations` and then we called the add method on ` Operations` and we stored it to a
variable called `value_one`. 

When we print value_one, we get 11.  

We can use modules to store methods grouped to do similar things.

<h1>Public, Private, and Protected</h1>

A **public** method is a method available to anyone who knows either the class name or the object name.

These methods are readily available for the rest of the program to use and comprise the class's _interface_

Sometimes you'll have methods doing work in the class but don't need to be available to the rest of the program.

These method are defined as **private methods**.

```Ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
```

The output is 
```
NoMethodError: private method `human_years' called for
  #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=28>
```

Why do we get an error?

We have made the `human_years` method private by placing it under the `private` reserved word.

`private` methods are only accessible from other methods within the class.

private methods are not accessible outside of the class definition at all and are only accessible from inside the class without calling self.

What if we want an in-between method?

Enter **protected method**

Two rules
- Protected methods act like `private` methods outside of the class
- Protected methods are accessible like `public` methods inside the class

```
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end
```

```
fido = Animal.new
fido.a_public_method        # => Will this work? Yes, I'm protected!
```

The above code shows us that we can call a `protected` method from within the class, even with `self` prepended.

What about outside of the class?

```
fido.a_protected_method
  # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>
```
