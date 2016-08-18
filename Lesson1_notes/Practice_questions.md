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

  sparky = GoodDog.newTerm
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

  The output of the last line is `"Sparky"`

