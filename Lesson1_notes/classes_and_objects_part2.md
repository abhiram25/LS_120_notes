<h1> Class Methods </h1>

**Class methods** are methods we can call directly on the class itself, without having to instantiate objects.

When defining a class method, we prepend the method name with the word `self`.

Class methods are where we put functionality that does not pertain to individual objects.

Objects contain state, and if we have a method that does not deal with states, then we can just call it a class method.

<h1>Class Variables</h1>

Just like instance variables capture information related to specific instances of classes, we can create variables for an entire class
that are appropriately named **class variables**.  Class variables are created using two `@` symbols, `@@`.

```Ruby
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2
```

Our class variable `@@number_of_dogs` is initialized to 0

Every time we had a new instance of the class GoodDog, the initialize method is being ran which increments the class variable `@@number_of_dogs` by 1.

This is an example of using a class level variable and a class method to keep track of class level detail that pertains to the class and not to individual objects.

Let's say we have a classroom full of students, initially we don't have any students, but as more students enroll we increase the number of students each time a student enrolls.  In the example below we create a **class variable** called `@@number_of_students` and we initialize it to 0.

```Ruby
class ClassRoom
	@@number_of_students = 0

	def initialize
		@@number_of_students += 1
	end

	def self.total_number_of_students
		@@number_of_students
	end
end

puts ClassRoom.total_number_of_students
# => 0

Abhi = ClassRoom.new

puts ClassRoom.total_number_of_students
# => 1

Jason = ClassRoom.new

puts ClassRoom.total_number_of_students
# => 2
```


We have a class called `ClassRoom` and we initialized the `@@number_of_students` to 0.  Every time we add a new
instance of the class, the `@@number_of_students` is incremented by one.

<h1>Constants</h1>

When creating classes, there may be certain variables that you never want to change.

You can do this by creating **constants**.

**Constants** are created using an uppercase letter at the beginning of the variable name.

Most Rubyists, however, make the entire variable uppercase.

```Ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
```

What is happening below is that the puts method is automatically calling `to_s` on its argument which is the sparky object. 
By default the `to_s` method prints the objects class and the encoding of the object id.

```Ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)

spike = GoodDog.new("Spike", 3)
puts sparky.age             # => 28
puts spike.age

puts sparky # => #<GoodDog:0x007ffc9a93f2f8>
```

What happens when we create a custom to_s method below?

```Ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
  
  puts sparky # => This dog's name is Sparky and is 28 in dog years.
end
```

Why did the output work here?

We were able to change the output by overriding the default `to_s` method that comes with Ruby.

<h1> More about self </h1>

We use `self` to reference a specific scope within our program.
`self` can refer to different things depending on where it's used.

1. Using `self` allows Ruby to disambiguate between using a local variable and calling a setter method.
2. `self` is used for class method definitions

What does `self` really represent?

```Ruby
# good_dog.rb

class GoodDog
  # ... rest of code omitted for brevity

  def what_is_self
    self
  end
end
```

```Ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self
 # => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">
 ```
 
 From within this class we are returning the calling object `sparky`
 
 When `self` is prepended to a method definition, it is defining a **class method**
 
 Rules to remember:
 
 1. `self`, inside of an instance method reference the instance(object) that called the method, the object.
    Therefore, `self.weight=` is the same as `sparky.weight=`, in our earlier example.

 2. `self`, outside of an instance method references the class and can be used to defined class methods.  There `self.name=(n)` is the same as `def GoodDog.name=(n)`.

`self` is a a way of being explicit about what our program is referencing and what our intentions are as far as behavior.

`self` changes depending on the scope it is defined in.
 
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


