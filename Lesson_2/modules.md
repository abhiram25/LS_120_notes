<h1>Modules</h1>

One of the downsides of inheritance is that class can only sub-class from a super class.

```Ruby
module swimmable
  def swim
  end
end

class Pet
end

class Fish < Pet
  include swimmable
end

class Mammals < Pet
  def run
  end

  def jump
  end
end

class Dog < Mammals
  include swimmable
  
  def speak
    "Woof!"
  end
  
  def fetch
  end
end

class Bulldog < Dog
  def swim 
    "can't swim"
  end
end

class Cat < Mammals
  def speak
    "Meow!"
  end
end
```

