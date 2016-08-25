<h1>Inherirance and Variable Scope</h1>

<h2>Instance Variables</h2>

```
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark! Teddy bark! bark!
```

We are able to access `@name` because since the `Dog` doesn't have the `initialize` instance method, the method lookup path
went to the superclass `Animal` and execution `Animal#initialize`.

That's when the `@name` instance variable was initialized and that's why we are able to access it from `teddy.dog_name`

```
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark! bark! bark!
```

In this case `@name` is `nil` because @name was never initialized and the `Animal#initialize` method was never executed.
Remember uninitialized instance variables return `nil`.

How do modules affect instance variables?

```
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  # => nil
```

The output at the bottom is `nil` because `@can_swim` method was never initialized.

```
teddy = Dog.new
teddy.enable_swimming
teddy.swim                                  # => swimming!
```

We get the desired output this time because we called the `enable_swimming` method and 
as a result `@can_swim` was initialized.

<h2>Class Variables</h2>

```
class Animal
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals                           # => 1
```

It looks class variables are accessible to sub-classes.

It can be a huge problem when working with class variables within the context of inheritance, because 
there is only one copy of the class variable across all sub-classes.

```
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => 2
Vehicle.wheels                              # => 2  Yikes!
```

The class variable in the sub-class `Motorcycle` affected the class variable in the super class.

This change will affect all other subclasses of `Vehicle`.

**Main Takeaway**

An entire subclass of a superclass can modify a class variable.

**Constants**

Can we reference a constant defined in a different class?

```
class Dog
  LEGS = 4
end

class Cat
  def legs
    LEGS
  end
end

kitty = Cat.new
kitty.legs     # => NameError: uninitialized constant Cat::LEGS     
```

There is an error because Ruby is looking for `LEGS` within the `Cat` class.

This is the same behavior as class or instance variables(except referencing an unitialized instance variable returns nil)

How can we reference the `LEGS` constant?

```
class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS                               # added the :: namespace resolution operator
  end
end

kitty = Cat.new
kitty.legs     
```

We added the `::`, which is the namespace resolution operator.

Let's look at the behavior of constants in a sub-class

```
class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels                                  # => 4

a_car = Car.new
a_car.wheels                                # => 4
```

A constant initialized in a superclass is inherited by a subclass and
can be accessed by both class and instance methods.



```
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires  
```


