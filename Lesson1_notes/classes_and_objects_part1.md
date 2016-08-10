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
end
```

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


