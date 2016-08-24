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

