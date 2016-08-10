<h1>Encapsulation</h1>

**Encapsulation** is hiding pieces of functionality and making it unavailable to the rest of the code base

**Polymorphism** is the ability for data to be represented as many different types.

**Inheritance** - class inherits the behaviors of another class referred to a **superclass**

Smaller **subclasses** will have more fine-grained detailed behaviors

Another way to apply a polymorphic structure is to use a `module`.

A `module` is a set of behaviors that multiple classes can use in a program using a `mixin`

Example provided below

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
