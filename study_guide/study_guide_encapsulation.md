# Encapsulation

Encapsulation is how we define boundaries in our application that hides certain functionality and makes it unavailable from the rest of the codebase. Through encapsulation, we can hide the internal representation of an object, and only expose the necessary methods and properties that the client needs access to. This provides data protection from unintentional modification or manipulation.

In Ruby we achieve encapsulation by creating objects and exposing interfaces to interact with those objects.

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