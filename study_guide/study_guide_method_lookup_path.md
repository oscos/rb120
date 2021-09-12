# Method Lookup Path

The method lookup path is the order in which classes are inspected whenever a method is invoked on an instance of that class. Stated differently, it is the distinct path that Ruby follows when a method is invoked on an instance of that class.  Understanding the method lookup path will give the programmer a better understanding of how and where the available methods are organized.  To view the method lookup path, you can invoke the `ancestor` class method on the class name.

When mixing in modules into a class, the order in which the modules are added is important.  This is because if the invoked method is not found within the object's class, Ruby will then search the modules beginning with the last module that was mixed into the class and work its way up to the first module.  Ruby will continue to look for the method within the superclasses and any mixed in modules.  This process continues in an ordered linear fashion until either the method is found or there a no more places to look. At which point Ruby will raise the "No method found" error.

**Example order of execution for method lookup path.
```ruby
module Greetable
  def greets
    puts "Greets customer"
  end
end

module Assistable
  def assists
    puts "Assists customer"
  end
end

class Employee
  def works
    puts "I work"
  end
end

class Cashier
  include Greetable
  include Assistable
end

class Bagger
  include Assistable
  include Greetable
end

class Stocker
end

p Cashier.ancestors
p Bagger.ancestors
```