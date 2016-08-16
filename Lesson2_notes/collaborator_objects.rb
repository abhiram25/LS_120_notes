
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

**Instance** variables can hold any object, not only strings and integers like the example above.

