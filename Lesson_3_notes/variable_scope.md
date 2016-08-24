<h1>Variable Scope</h1>

<h2>Instance Variable Scope</h2>

**Instance** variables are variables that are scoped at the object level and start with `@`.

They are used to track individual object state and do not cross over between objects.

We can use the `@name` variable to separate the state of `Person` objects.

```
class Person
  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect              # => #<Person:0x007f9c830e5f70 @name="bob">
puts joe.inspect              # => #<Person:0x007f9c830e5f20 @name="joe">
```

Unlike local variables, instance variables are accessible within in instance method even if they are not 
initialized or passed into the method.

Their scope is at object level.

What happens if we try to access an instance variable not initialized anywhere?

```
class Person
  def get_name
    @name                     # the @name ivar is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => nil
```

If you try to reference an unitialized local variable, you'd get a `NameError`, but if you try to reference an
unitialized instance variable, you get `nil`.

What happens if you put accidentally define a variable at class level?

```
class Person
  @name = "bob"              # class level initialization

  def get_name
    @name
  end
end

bob = Person.new
bob.get_name                  # => nil
```

When you define a variable at class level, we create class level instance variables.

<h2>Class Variable Scope</h2>

Class variables start with `@@` and are scoped at the class level.

There are two behaviors of class variables:
- All objects share 1 copy of the class variable.
- class methods can access class variables regardless of where it's initialized.

<h2>Constant Variable</h2>

Constants have a **lexical** scope

Constants are available in class methods or instance methods.

