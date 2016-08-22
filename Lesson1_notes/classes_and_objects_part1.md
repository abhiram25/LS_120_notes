<h1>States and Behaviors</h1>

**states** - specific attributes for individual objects

**behaviors** - What objects are capable of doing

We would use **instance variables** to track this information

**Instance Variables** are scoped at the object level

Ex)

We have a class called `Student`, we all have the same behavior such as learning and programming.

However, each student will be in a different course, the course they are currently doing in Launch School
will be the state.

Here is what our class will look like.

```
class Student
  def initialize(name, course)
    @name = name
    @course = course
  end
end
```

In the above example, `@name` and `@course` are our **states**.

Let's create an object for `Student`

```
abhi = Student.new("Abhi", 120)
```

The string `"Abhi"` and the integer `120` is being passed from the `new` method through the `initialize` method
and is assigned to the local variables `name` and `course` respectively, which results in the string `"Abhi"` being passed into 
the `@name` instance variable and also `120` is being passed into the `@course` instance variable.

The underlying principle is that every object's state is unique and instance variables are how we keep track.

**Instance** variables are responsible for keeping track of information about the _state_ of an object.

The state of the object is being tracked in the instance variable.

Let's create another `Student` object.

We have a student named, Jambalaya.  Jambalaya is in course 220.

``` 
jambalaya = Student.new("Jambalaya", 220)
```

Just like the object `abhi`, the string `"Jambalaya"` and the integer `220`
is being passed in from the `new` method through to the `initialize` method 
and the string `"Jambalaya` is assigned to the `@name` instance variable and 
`220` is being assigned to the `@course` instance variable. 

The objects `abhi` and `jambalaya` are objects of the class `Student`, each object
has different states.  Both objects have different names and different courses.

<h1>Instance Methods</h1>

We will give our students some behaviors called `learn` and `program`.

```
class Student
  def initialize(name, course)
    @name = name
    @course = course
  end

  def learn
 		"learning"
  end
  
  def program
  	"programming"
  end
end

puts abhi.learn => "learning"
puts jambalaya.program => "programming"
```

Both Jambalaya and Abhi are able to `learn` and `program`.

What if we wanted to put say something like "Abhi is learning in course 120"?

In our instance methods, we have access to all instance variables.

So we can do something like this.

```
  def learn
 	"#{@name} is learning in course #{course}"
  end
```

Now we are exposing the states of the objects using instance methods.

```
	puts abhi.learn => "Abhi is learning in course 120"
	puts jambalaya.learn => "Jambalaya is learning in course 220"
```

<h1>Accessor Methods</h1>

What if we wanted to print out `abhi`'s course number.

We could try this code below.

```
puts abhi.course
```

Take a moment and think about what the output would be.

The output will be 

```
NoMethodError: undefined method `course' for #<Student:0x007f91821239d0 @course=120>
```

`NoMethodError` means the method doesn't exist or is unavailable to the object.

If we want to access the object's course, which is stored in the `@course` instance variable,
we have to create a method that will return the course.  We can call it `get_course` and its only job
will be to return the value in the `@course` instance variable.

```
class Student
  def initialize(name, course)
    @name = name
    @course = course
  end

  def learn
 		"learning"
  end
  
  def program
  	"programming"
  end
  
  def get_course
  	@course
  end
end

puts abhi.get_course => 120
```

Excellent! This worked.  Now we created out **getter** method.  

So Let's say `Abhi` passes his assessment, how can we update the course
he is currently in? 

Enter **setter** methods. Looks a lot like a `getter` method, but there is a tiny difference.
Let's add it.

```
class Student
  def initialize(name, course)
    @name = name
    @course = course
  end

  def learn
 		"learning"
  end
  
  def program
  	"programming"
  end
  
  def get_course
  	@course
  end
  
  def update_course=(number)
  	@course = course
  end
end

abhi = Student.new("Abhi", 120)
puts abhi.get_course => 120
abhi.update_course = 170
puts abhi.get_course => 170
```

The output is:

```
120
170
```

Not only Abhi passed his assessment, but we have successfully changed `abhi`'s course to 170.

First thing you should notice about the `update_course=` is that Ruby gives us a special syntax to use it.

To use the `update_course=` method normally, it is the same as `abhi.update_course=(170)`, the
`update_course=` is the method name, and the integer `170` is the argument being passed in the method.

When you see this code, realize there is a `update_course=` working behind the scenes, Ruby recognizes this is 
a **setter** method and allows us to use the method naturally like this.

`abhi.update_course = 170`

Rubyists prefer to name those **setter** and **getter** methods using the same name
as the instance variable they are exposing and setting.  

Instead of using the `get_course` and `update_course` methods to get the course and update the course,
we want to use the name our method `course` to get the the course and update the course.

```
class Student
	def initialize(name, course)
		@name = name
		@course = course
	end
	
	def course
		@course
	end
	
	def course=(number)
		@course = number
	end
	
	def learn
		"#{@name} is learning in course #{@course}"
	end
	
	def program
		"programming"
	end
end
	
	abhi = Student.new("Abhi", 120)
	puts abhi.learn => "Abhi is learning in course 120"
	puts abhi.course => "120"
	abhi.course = 170
	puts abhi.course => "170"
```

Excellent, we created our setters and getters for `course`, however we took up a lot of space within our class.
If we had other states we want to track, the class would be even longer.

What if I told you Ruby has a built in way to automatically create these setters and getters for us?

Enter `attr_accessor` method.

```
class Student
	attr_accessor :course
	
	def initialize(name, course)
		@name = name
		@course = course
	end

	def learn
		"#{@name} is learning in course #{@course}"
	end
	
	def program
		"programming"
	end
end
	
	abhi = Student.new("Abhi", 120)
	puts abhi.learn => "Abhi is learning in course 120"
	puts abhi.course => "120"
	abhi.course = 170
	puts abhi.course => "170"
```

The output is the same, as you can see above, there is no need for the `course` or `course=(number)` getter and setter methods,
because the `attr_accessor` method creates the setters and getters for us.

What if we want the student's name without changing it.

Enter `attr_reader` method

It works the same way as the `attr_accessor` method, but only allows you to retrieve the instance variable.

Let's create our `attr_reader` that takes the `symbol` `:name` as an argument.

```
class Student
	attr_accessor :course
	attr_reader :name
	
	def initialize(name, course)
		@name = name
		@course = course
	end

	def learn
		"#{@name} is learning in course #{@course}"
	end
	
	def program
		"programming"
	end
end
	
	abhi = Student.new("Abhi", 120)
	puts abhi.learn => "Abhi is learning in course 120"
	puts abhi.course => "120"
	abhi.course = 170
	puts abhi.course => "170"
```

In the example above, we can retrieve name, but we cannot change the `name` instance variable on an object.

Let's see what happens when we try

```
undefined method `name=' for #<Student:0x007fb91c15f040 @name="Abhi", @course=120> (NoMethodError)
```

So the error above tells us there is no `name=` for the `abhi` object.

If we just use the `name` method for for the `abhi` object.
This is our output.

```
abhi.name => "Abhi"
```

What if we only want to update an instance variable but not retrieve it?

Enter `attr_writer` method

Let's say we want to update the course, but not retrieve it.

```
class Student
	attr_writer :course
	attr_reader :name
	
	def initialize(name, course)
		@name = name
		@course = course
	end

	def learn
		"#{@name} is learning in course #{@course}"
	end
	
	def program
		"programming"
	end
end
	
	abhi = Student.new("Abhi", 120)
```

If we try to retrieve it, here is our output.

```
undefined method `course' for #<Student:0x007fc21c1232f8 @name="Abhi", @course=120>
```

As you can see above, there is no `course` method for the object `abhi` or any instances of the class `Student`.

We can only update course at this point like so:

```
abhi.course = 170 => The instance variable @course is now assigned to 170 inside the object abhi
```

We can also use these methods inside the class as well.

```
def learn
	"#{@name} is learning in course #{@course}"
end
```

Instead of reference the variable directly, we want to use the name getter method and the 
course getter method which is given to us by the `attr_reader` and `attr_accessor` methods.

```
def learn
	"#{name} is learning in course #{course}"
end
```

This is cool and all, but why can't we just use `@name` and `@course`?

So each student and Launch School has a debit or credit card and we don't want
to expose the raw data or the entire credit card number.  

Let's say my card number is 5434-7896-4332-1998

We only want the last 4 digits visible, so it should
look something like this xxxx-xxxx-xxxx-1998.

```
def card_number
	xxxx-xxxx-xxxx- + @card_number.split("-").last
end
```

If we were to reference `@card_number`, then we will have exposed the entire credit card number.

If we reference card_number, we get the following output below:

```
abhi.card_number => xxxx-xxxx-xxxx-1998
```

If we reference `@card_number`, we get the following output:

```
	5434-7896-4332-1998
```

If we found a bug in this code or someone wants to change the format, we can refernce the `card_number` getter method
and make the changes there.

We can now use the `card_number` method without the `@` throughout our class to retrieve the card number.

What if we wanted to change our information.

We could implement something like this.

```
class Student
	attr_accessor :name, :course 
	
	def initialize(name, course)
		@name = name
		@course = course
	end

	def learn
		"#{@name} is learning in course #{@course}"
	end
	
	def program
		"programming"
	end
	
	def change_info(n, c)
		@name = n
		@course = c
	end
	
	def info
		"Name: #{name} Course: #{course}"
	end
end
	
abhi = Student.new("Abhi", 120)
```

We can use the `change_info` method like this
```
abhi = Student.new("Abhi", 120)
puts abhi.info => Name: Abhi Course: 120

abhi.change_info("Abhiram", 170) 
abhi.info => Name: Abhiram Course: 170
```

Let's change the `change_info` method to this

```
def change_info(n, c)
  name = n
  course = c
end
```

abhi.change_info("Abhiram", 170) 
abhi.info => Name: Abhi Course: 120

So our setter methods didn't work, why?

The reason our setter methods didn't work is because Ruby thought we were instantiating
local variables.  

To disambiguate from creating a local variable, we need to use the `self.name=` to let Ruby know
we are calling a method.

```
def change_info(n, c)
  self.name = n
  self.course = c
end
```










