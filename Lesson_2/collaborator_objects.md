```Ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

joe = Person.new("Joe")
joe.name                    # => "Joe"
```

In the above example, the string `"Joe"` is being saved in the `@name` instance variable.

**Instance variables** can hold any object, not only strings and integers.  It also holds data such as arrays and hashes.

```Ruby
class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end

  def cash_on_hand
    # this method will use @cash to calculate total cash value
    # we'll skip the implementation
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person.new
joe.cash_on_hand            # => "$62.00"
joe.heroes                  # => "Superman, Spiderman, Batman"
```

As you can see above, we can use any object to represent an object's state. Instance variables can be set to any object.  
Even an object of a custom class we've created. 

```Ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
```

What if the person has a pet?

```Ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
```

The last line allows us to set bob's `@pet` instance variable to `bud`, which is a `Bulldog` object.  When we call `bob.pet`, 
it means we are returning a `Bulldog` object.

```Ruby
bob.pet                       # => #<Bulldog:0x007fd8399eb920>
bob.pet.class                 # => Bulldog
```

Because `bob` is a `Bulldog` object, we can chain any `Bulldog` methods at the end as well:

```Ruby
bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"
```

Now let's allow the `Person` to have as many pets as they want.

```Ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]
```

```Ruby
bob.pets.jump                  # NoMethodError: undefined method `jump' for [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]:Array
```

Because it's an array, you cannot just call `Pet` methods on pets.  `jump` is an not an array method, that's why we got an error.

If we want to make each individual pet jump, we'll have to parse out the elements in the array and operate on the individual object `Pet`.

``` Ruby
bob.pets.each do |pet|
  pet.jump
end
```



