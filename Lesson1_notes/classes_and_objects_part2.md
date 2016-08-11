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
 

