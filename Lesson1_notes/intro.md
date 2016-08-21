<h1>Encapsulation</h1>

**Encapsulation** is hiding pieces of functionality and making it unavailable to the rest of the code base

**Polymorphism** is the ability for data to be represented as many different types.

**Inheritance** - class inherits the behaviors of another class referred to a **superclass**

Smaller **subclasses** will have more fine-grained detailed behaviors

For example, we can have a `Manager` and that could be a **superclass**, then we have small subclasses
called `employee` which inherit behaviors from the `Manager`.

Another way to apply a polymorphic structure is to use a `module`.

A `module` is a set of behaviors that multiple classes can use in a program using a `mixin`

**class** - Basic outline of what a class should be made of and what it should do.

```Ruby
class GoodDog
end

sparky = GoodDog.new
```

In the above example, `sparky` is an object or instance of class `GoodDog`.  The entire workflow of creating a new object or instance of a class is called **instantiation**.  

The important fact here is that an object was returned by calling the class method `new`.

Example of use of **modules**

```Ruby

module SupportAndMaintain
  def maintain
  end

  def answer
  end

  def write(content)
  end

  def create_xercise
  end
end

class Instructor
  include SupportAndMaintain	

  def interview
  end

  def student_intro
  end

  def conduct_webinar
  end

  def approve_assessment
  end
end

class TA
  include SupportAndMaintain
	
  def grade_assessment
  end

  def code_review
  end
end

Chris = Instructor.new

Kevin = Instructor.new
```

The module `SupportAndMaintain` were created because TA's and Instructors 
share responsibilities regarding support
and maintaining the website

Methods were also defined in the Intstructor class and TA class.  For example, the Instructor interviews students
while the TA has individual responsibilites such as reviewing code and also grading the first part of the assessment.
