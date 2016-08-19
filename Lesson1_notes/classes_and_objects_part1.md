<h1>States and Behaviors</h1>

**states** - specific attributes for individual objects

**behaviors** - What objects are capable of doing

For example, we have two athletes Lebron James and Roger Federer

They are both Athletes, but may contain different information such as the sport they play.

We would use **instance variables** to track this information

**Instance Variables** are scoped at the object level

Even though Roger Federer and Lebron James are two different Athletes, they have
common behavior such as play and train

```Ruby 
class Athlete
	def initialize(name, sport)
		@name = name
		@sport = sport
	end
	def play
		"Playing #{@sport}"
	end

	def train
		"#{@name} is training"
	end
	
	def play
		"Playing #{sport}"
	end

	def train
		"#{name} is training"
	end
end
```

<h1>Why not just use the @instance variable?</h1>

Suppose we have an instance variable for Social security number, we only want to show the last 4 numbers

```Ruby
class Customer
	def initialize(ssn)
		@ssn = ssn
	end

	def ssn
		"xxx-xx-" + @ssn.split("-").last
	end
end

Jack = Customer.new("411-37-9456")

puts Jack.ssn
```

It's much easier to reference this string in one place in the code rather than sprinkle it anywhere else for debugging.

```Ruby
class GoodDog
	def initialize
		puts "Instance method was declared"
	end
end

Spot = GoodDog.new
```

In the above example, instantiating a new `GoodDog` object resulted in the
string being outputted.

The `initialize` method is a constructor
because it is triggered when we create a new object

```Ruby
class GoodDog
	def initialize(name)
		@name = name
	end
end

spot = GoodDog.new("Spot")
```
The `@` symbol in front of name looks different because it is an instance variable

The string "Spot" is being passed from the `new` method through to the the `initialize` method
and then we set the instance variable of `@name` to name

**instance** variables are responsible for keeping track of information about the state of an object

In the above example, the name for the `sparky` object is the string "Sparky".  The state for this object
is being passed in the instance variable `@name`

We create another GoodDog object below and the the name is now "Fido"

```Ruby
fido = GoodDog.new("Fido")
```

```Ruby
class Athlete
	def initialize(name, sport)
		@name = name
		@sport = sport
	end
end

roger_federer = Athlete.new("Roger Federer", "tennis")

lebron_james = Athlete.new("Lebron James", "basketball")
```

<h1>Instance Methods</h1>

```Ruby
class Athlete
  def initialize(name, sport)
		@name = name
		@sport = sport
	end

	def play
	  "Playing #{@sport}"
	end

	def train
	  "#{@name} is training"
	end
end

roger_federer = Athlete.new("Roger Federer", "tennis")

lebron_james = Athlete.new("Lebron James", "basketball")

puts roger_federer.play
# => "Playing tennis"

puts lebron_james.play
# => "Playing basketball"

puts roger_federer.train
# => "Roger Federer is training"

puts lebron_james.train
# => "Lebron James is training"
```
In the above example for the instance method play, we are able to access the instance variable sport within the instance method `play` and we are also able to access the instance variable name in the instance method `train`.

If I wanted to print Roger Federer's name 

We could try this
puts `roger_federer.name`

I would get something like this undefined method `name` for `#<Athlete:0x007f82fb092d08> (NoMethodError)`

name is not an instance method, which is why we can't get the name

If we want to retrieve the name, we create a method that will return the name.  We can call it get_name and all it will do is return
the name in the `@name` instance variable

```Ruby
class Athlete
	def initialize(name, sport)
		@name = name
		@sport = sport
	end

	def play
		"Playing #{@sport}"
	end

	def get_name
		@name
	end

	def train
		"#{@name} is training"
	end
end

puts lebron_james.get_name
#=> "LeBron James
```

This is what we call our getter methods, now what if we wanted to change the name, we'd have to create a setter method

Let's say I want to change the name from LeBron James to Tim Duncan

```Ruby
class Athlete
	def initialize(name, sport)
		@name = name
		@sport = sport
	end

	def play
		"Playing #{@sport}"
	end

	def get_name
		@name
	end

	def set_name=(name)
		@name = name
	end

	def train
		"#{@name} is training"
	end
end

lebron_james.set_name("Tim Duncan")
puts lebron_james.get_name
# => Tim Duncan
```

To use the `set_name=` normally, it is the same as `lebron_james.set_name=("Tim Duncan")`

Rubyists use the same name as the instance variable for the setter and getter methods.

Below is an example where we would set an instance variable to a different value

```Ruby
class BballPlayer
	def initialize(name, team)
		@name = name
		@team = team
	end

	def name
		@name
	end

	def team
		@team
	end

	def name=(name)
	end

	def team=(team)
		@team = team
	end
end

kevin_durant = BballPlayer.new("Kevin Durant", "OKC Thunder")

puts kevin_durant.team
# => "OKC Thunder"

kevin_durant.team = "Golden State Warriors"

puts kevin_durant.team
# => Golden State Warriors
```
If you're a sports fan, you'd realize that Kevin Durant left OKC for Golden State.  So What we did here is have a setter
in place `team=(team)` and we set the new value "Golden State Warriors" to the instance variable `@team`

As you can see above, creating those setter and getter methods took up a lot of room for just the simple features of getting and setting values.  What If I wanted to add salaries and also what college they played for?  It would take up too much space so fortunately for us, Ruby has a buil-in way to automatically create these setter and getter methods for us, Enter **attr_accessor** method.

```Ruby
class BballPlayer
	attr_accessor :name
	attr_accessor :team

	def initialize(name, team)
		@name = name
		@team = team
	end
end

kevin_durant = BballPlayer.new("Kevin Durant", "OKC Thunder")

puts kevin_durant.team
# => "OKC Thunder"

kevin_durant.team = "Golden State Warriors"

puts kevin_durant.team
```
Look how much cleaner our code is above.

Instead of creating separate setter and getters for `:name` and `:team`, we simply used the `attr_accessor` methods to create these setters and getters for us.

The `attr_accessor` method takes a symbol as an argument, which it uses to create the setter and getter methods.  Those two lines replaced 4 method definitions.

What if we only wanted a getter method or a setter method?

We can use `attr_reader` method for the getter method or `attr_writer` method for the setter.

**NOTE**: All of the `attr_*` methods take a symbol as an argument

In the code above, since we are using more than one symbol to create multiple setter and getter methods, we can put it on one line like this

```Ruby
class BballPlayer
	attr_accessor :name, :team

	def initialize(name, team)
		@name = name
		@team = team
	end
end

kevin_durant = BballPlayer.new("Kevin Durant", "OKC Thunder")

puts kevin_durant.team
# => "OKC Thunder"

kevin_durant.team = "Golden State Warriors"

puts kevin_durant.team
# => "Golden State Warriors"
```

In the example above we are tracking more than one state, so we use that syntax above for `attr_accessor`

```Ruby
	def dribble
		"#{@name} dribbles"
	end
```

```Ruby
class Customer
	def initialize(ssn)
		@ssn = ssn
	end

	def ssn
		"xxx-xx-" + @ssn.split("-").last
	end
end

Jack = Customer.new("411-37-9456")

puts Jack.ssn # => "xxx-xx-9456"
```

In the above example, it's much easier to reference to one area in this case, because when we have to debug, it's a lot easier.

Because of our `attr_accessor` method, we don't have to reference the `@sport` or `@name` instance variables directly and just use sport and name calling upon the the instance method rather than instance variable.

```Ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```

We could use the `change_info` method like this

```Ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```

Let's change the implementation of our method
```Ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

```Ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info # => Sparky weighs 10 lbs and is 12 inches tall.
```
What happened? The method didn't change `sparky`'s information.

The reason why our setter methods didn't work is because Ruby thought we were instantiating local variables

To disambiguate from creating a local variable, we need to use the `self.name=` to let Ruby know that we're calling a method.
So our change.info method should be updated to this.

```Ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

When we run te code, our output is:

```Ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```


