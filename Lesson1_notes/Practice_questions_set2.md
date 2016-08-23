Read the questions, below and write your answers down.

The idea is to improve good written communication and also be more precise.

Writing these answers down will force you to think about what you are saying and the understanding should stick into memory.

Take a separate sheet of paper or type your answers in a word document.

 1. What is a **class method**? How do we define a **class method**?

    **Solution**

    Methods we can call directly on the class itself, without having to instantiate objects.
   
    We define a class method by prepending `self` before the method.
   
    **class methods** are where we put functionality that doesn't pertain to individual objects.
   
 2. How can we differentiate between **instance** variables and **class** variables?
   
    **Instance** variables have one `@` in front of it `@instance`

    **Class** variables have two `@`'s in front of it `@@class`.
 
 3. What is the output of the last line and why?
    
    ```
    class ClassRoom
      @@number_of_students = 0

     def initialize
        @@number_of_students += 1
     end

     def self.total_number_of_students
        @@number_of_students
     end
    end

    puts ClassRoom.total_number_of_students

    abhi = ClassRoom.new

    puts ClassRoom.total_number_of_students

    jason = ClassRoom.new

    puts ClassRoom.total_number_of_students
    ```
    
    **Solution** 
    
    The output of the last line is 2.  We initiliazed the class variable `@@number_of_students` to 0 and when we
    created our object `abhi`, we incremented `@@number_of_students` by 1 because each time we create a new instance
    of the class `ClassRoom`, we increment `@@number_of_students` because `@@number_of_students += 1` is in our `initialize` method.
    
    When the new object `jason` is created, the **class** variable `@@number_of_students` is now 2 because we created another instance.
    
    On the last line we call the method `total_number_of_students` on the class `ClassRoom`, which returns the variable `@@number_of_students` and `@@number_of_students` is assigned to 2, so as a result we get 2 printed.
    
 4. What is the output of the last line and why? 
 
    ``` 
      class GoodDog
      DOG_YEARS = 7
    
      attr_accessor :name, :age
    
      def initialize(n, a)
        @name = n
        @age  = a * DOG_YEARS
      end
    
      def to_s
        "This dog's name is #{name} and it is #{age} in dog years."
      end
    end
    
      spot = GoodDog.new("Spot", 4)
      puts spot
    ```  
   
      **Solution**
    
      The output of the last line is `"This dog's name is Spot and it is 28 in dog years."`
    
      The `to_s` method defined in the class `GoodDog` overrides Ruby's built-in `to_s` method.
      
 5. What does `self` reference here?
      
     ```
     # good_dog.rb

     class GoodDog
     # ... rest of code omitted for brevity

      def what_is_self
       self
      end
    end
    ```
    
    `self` references an instance of the Class `GoodDog`.
    
 6. What is `self` referencing here? What is the underlying principle?

   ``` 
   class GoodDog
     # ... rest of code omitted for brevity
     puts self
   end
  ```
  **Solution**
  
  `self` is referencing `GoodDog`.  The underlying principle is that when we use self outside of a method, we reference the class.

    
