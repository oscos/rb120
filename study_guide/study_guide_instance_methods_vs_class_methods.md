# instance methods vs class methods
In ruby, classes is where  we define attributes and behaviors for objects.  We use instance methods to define those behaviors.  Instance methods are available for reference when there is an instance of a class.  As such they can only be invoked on objects of the class in which they are defined for. 

```ruby
# 
class Customer
  def initialize(name)
    @name = name
  end
  
  def greeting
    puts "Good day #{@name}"
  end
end
  
oscar = Customer.new("Oscar")
oscar.greeting 
```

Class Methods are methods that we can call on the class directly without having to instantiate any objects.  This is because class methods belong to the class itself. We use class methods when we need to define functionality that does not  pertain to individual objects 

```ruby
class Customer
  def self.who_am_i
    puts "I am a class method"
  end
end

Customer.who_am_i
```