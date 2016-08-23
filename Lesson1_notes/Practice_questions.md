<h1>Practice Questions</h1>

Read the questions, below and write your answers down.

The idea is to learn good written communication and
also be more precise.

Writing these answers down will force you to think about
what you are saying and the understanding should stick into 
memory.  

Take a separate sheet of paper or type your answers in a word 
document.  

Remember **no peeking** at the solution.


1. What is **Encapsulation**?

  **Solution** 

  Hiding pieces of functionality and making it unavailable for the rest of the code base.

2. What is **Polymorphism**?

  **Solution** 

  Ability for data to be represented as different types.

3. What are **states**?

  **Solution** 

  specific attributes for individual objects

4. What is a **Module**?

  **Solution** 

  Collection of behaviors that is available for a class via mixins using the include key word.

5. What is a class?

  **Solution**

  Basic outline of what an object should be made of and what it should do.

6. What is going on here? Be precise.

  ```Ruby
  class GoodDog
  end

  sparky = GoodDog.new
  ```

  **Solution**

  We created the class GoodDog, then we have instantiated an object called sparky, 
  which is an instance of the class GoodDog.  

7.  What is going on in the code below.  Be precise

  ```Ruby
  module Speak
    def speak(sound)
      puts "#{sound}"
    end
  end

  class GoodDog
    include Speak
  end

  class HumanBeing
    include Speak
  end

  sparky = GoodDog.new
  sparky.speak("Arf!") # => Arf!
  bob = HumanBeing.new
  bob.speak("Hello!") # => Hello!
  ```
  **Solution**

  We created a module called speak and we included the module in the classes GoodDog and HumanBeing. 
  We included the methods in the classes via mixin and as a result the behaviors in the Speak module 
  are shared by the classes and it's objects.

8. What are **states**?

  **Solution**

  Specific attributes for individual objects.

9. What is an **instance variable**?

  **Solution**

  Track information about state of an object.

  Scoped at the object level

10.  What is special about the initialize method?

  **Solution**

  The initialize method is treated as a constructor because it is triggered when we create a new objects.

11. What is happening here? Be precise.

  ```Ruby
  class GoodDog
    def initialize(name)
        @name = name
    end
  end

  spot = GoodDog.new("Spot")
  ```

  **Solution**
  
   The `initialize` method gets called everytime you call a new object.  Instatiation of the `GoodDog` object has triggered the 
   initialize method and we passed an argument to the initialize method through the `new` method.
   
   The string `Spot` is being passed from the `new` method and is assigned to the param local variable `name`.  Afterwards we set the instance variable `@name` to `name`, which results in assigning the string `"Sparky"` to the `@name` instance variable.
   
12. What is the output of the last line and why?
  
 ```Ruby
   class GoodDog
    def initialize(name)
      @name = name
    end

    def speak
      "Arf!"
    end
  end

  sparky = GoodDog.new("Sparky")
  puts sparky.speak
  ```
  **Solution**

  The output of the last line is "arf" because when created the instance method `speak`, the method
  returned "arf".
  
13. What is the output of the last line and why?  What is the underlying principle?
  
   ```
   class GoodDog
     def initialize(name)
     @name = name
   end

   def get_name
     @name
   end

   def speak
    "#{@name} says arf!"
   end
  end

  sparky = GoodDog.new("Sparky")
  puts sparky.speak
  puts sparky.get_name 
  ```
  
  **Solution**
  
  The output of of the last line is `"Sparky"` because when we created the `get_name` method, the return value of this method is 
  the instance variable `@name`.  The underlying principle is that to retrieve data from an object outside of the class, we need
  to create a `getter`.
 
14. What is output of the last line below and why?   
    ```
    # good_dog.rb

   class GoodDog
    def initialize(name)
    @name = name
   end

   def get_name
     @name
   end

   def set_name=(name)
     @name = name
   end

   def speak
    "#{@name} says arf!"
   end
  end

  sparky = GoodDog.new("Sparky")
  puts sparky.speak
  puts sparky.get_name
  sparky.set_name = "Spartacus"
  puts sparky.get_name
  ```
  
  **Solution**
  The output of the last line of this code is "Spartacus" because we called the `set_name=` method on `sparky`
  and as a result the instance variable `@name` is assigned to "Spartacus" 
  
  `sparky.set_name = "Spartacus"` is the same as `sparky.set_name=("Spartacus")`
  
15. How are we able to print out `sparky`'s name and also set `sparky`'s name to "Spartacus?
  ```
  class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
 end

 sparky = GoodDog.new("Sparky")
 puts sparky.speak
 puts sparky.name            # => "Sparky"
 sparky.name = "Spartacus"
 puts sparky.name            # => "Spartacus"
 ```

  **Solution**

  The `attr_accessor` method is written above and we passed in the symbol `:name` as an argument and as a result
  a `setter` and `getter` method was automatically created for `@name`.  

16. In your own words, explain what the difference between **attr_reader**, **attr_writer**, and **attr_accessor**

 **Solution**

  The `attr_accessor` method creates a `setter` and `getter` methods, which allows us retrieve and assign `@instance` variables.

  The `attr_reader` method creates a `getter` method, which only allows us to retrieve `@instance` variables.

  The `attr_writer` method creates a `setter` method, which only allows us to assign `@instance` variables.


