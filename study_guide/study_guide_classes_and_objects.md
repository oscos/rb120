# Classes and objects

In Ruby, anything that can be said to have a value is an object.  Objects represent real world nouns which have both attributes and behaviors.  Classes in ruby is where you define the attributes and behaviors for objects.  That is, the things that objects are made of and the things objects can do. Classes are like blueprints from which objects are created from. Through the process of instantiation, we create an instance of a class by invoking the `new` class method on the name of the class. This returns a new object that can be assigned to a variable.

**Example of class and object**
```ruby
class Employee
end

oscar = Employee.new
```

When creating objects of the same class, each new instance will have a unique `state` which tracks attributes for individual objects. Instance variables are used to track information about the `state` of an object and are scoped at the object level. While objects encapsulate `state`, classes encapsulate behavior. This ensures that objects belonging to the same class will have a unique `state` but identical behavior. Instance methods which are defined within a class are used to expose this behavior for objects.


**Example of a class with an attribute and behavior defined.**
```ruby
class Employee

  def initialize(name)
    @name = name
  end
  
  def works
    puts "#{@name} works"
  end
end

oscar = Employee.new("Oscar")
bryan = Employee.new("Bryan")
oscar.works
bryan.works
```