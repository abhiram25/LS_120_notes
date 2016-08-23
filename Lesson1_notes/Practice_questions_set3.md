Read the questions, below and write your answers down.

The idea is to improve good written communication and also be more precise.

Writing these answers down will force you to think about what you are saying and the understanding should stick into memory.

Take a separate sheet of paper or type your answers in a word document.

1. What is **inheritance**?
  
   **Solution**
  
   **Inheritance** is when a class inherits behaviors from another class.  
   The class that is inheriting the behavior is the **subclass** and the 
   class that is being inherited from is the **superclass**.

2. What is the output when we call the `speak` method on the `sparky` and `paws` object?
   
   ```
   # good_dog_class.rb

   class Animal
     def speak
      "Hello!"
    end
   end

   class GoodDog < Animal
   end

  class Cat < Animal
  end

  sparky = GoodDog.new
  paws = Cat.new
  puts sparky.speak
  puts paws.speak 
  ```
  
  **Solution**
  
  The outputs are `Hello!` for both objects when we call the `speak` method on them.
  
  The classes `GoodDog` and `Cat` are subclasses of `Animal`, so the method `speak` is inherited from 
  the `Animal` class.  
  
  When `speak` is called on the `paws` and `sparky` object, the return value of the `speak` method defined in
  `Animal` is printed.
  
  Ruby checks the classes of these objects first and then checks the **superclass** where `speak` is found.
  
3. When we call the speak method on `sparky`, why is it different?  What is the underlying principle?

  ```
  # good_dog_class.rb

  class Animal
    def speak
      "Hello!"
    end
  end

  class GoodDog < Animal
    attr_accessor :name

    def initialize(n)
      self.name = n
    end

    def speak
      "#{self.name} says arf!"
    end
  end

  class Cat < Animal
  end

  sparky = GoodDog.new("Sparky")
  paws = Cat.new

  puts sparky.speak           # => Sparky says arf!
  puts paws.speak             # => Hello!
  ```
  
  **Solution**
  
  The speak method is defined in the `GoodDog` class and it overrides the `speak` method
  defined in the `Animal` class because when the `speak` method is called on `sparky`, Ruby first
  looks at the `GoodDog` method because that `sparky` is the instance of the class `GoodDog`.
  
  It found the `speak` method in the `GoodDog` class and used it.
  
4. Sandy wants to get the name for the object `bruno`, the output is "brown".  What happened?

    ```
    class Animal
      attr_accessor :name
    
      def initialize(name)
        @name = name
      end
    end
    
    class GoodDog < Animal
      def initialize(color)
        super
        @color = color
      end
    end
    
    bruno = GoodDog.new("brown")
    bruno.name
    ```
  **Solution**
  
  When we called the `super` method we didn't pass in any arguments, so by default the argument `color` is passed into the `initialize`
  method in the superclass `Animal`.  As a result, we get "brown".
  
5. What does **namespacing** mean? What are the advantages?
 
    **Solution**

    Using modules to group similar classes in a module
    
    The advantages od namespacing is that:
    
    - We can group related classes
    
    - Reduces likelihood of classes colliding with other similarly named classes

6. What is a **public** method?

    **Solution**
   
    A **public** method is a method readily available to anyone who either knows the class name
    or object's name.  These methods are available for the rest of the program to use and comprise class's
    interface.

7.
    
    
