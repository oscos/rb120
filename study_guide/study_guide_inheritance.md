# Class Inheritance

Inheritance helps keep our code DRY by giving us a way to extract common logic between classes to one location for reuse.  Class Inheritance, and Interface Inheritance are two primary ways to implement inheritance in Ruby.  With Class Inheritance, common behaviors are extracted to a generic class referred to as the  `superclass` from which the more specialized classes referred to as `subclass` inherits from.  With Interface Inheritance, common behaviors are extracted to a module and mixed into the desired class(es). In this way the class inherits the interface provided by the mixin module.  

**Example of Class Inheritance**
```ruby
class Employee  
  def initialize(name)
    @name = name
  end
  
  def works
    puts "#{@name} does work"
  end
end

class Cashier < Employee
end

jill = Cashier.new("Jill")
jill.works
```

**Example of Interface Inheritance**
```ruby
module Assistable
  def assists
    puts "#{@name} assists customers"
  end
end

class Employee
  
  def initialize(name)
    @name = name
  end
  
  def works
    puts "#{@name} does work"
  end
end

class Cashier < Employee
  include Assistable
end

class Bagger < Employee
  include Assistable
end

class Stocker < Employee
end

jill = Cashier.new("Jill")
jack = Bagger.new("Jack")
tom = Stocker.new("Tom")

[jill, jack, tom].each do |employee|
  employee.works
end

[jill, jack].each do |employee|
  employee.assists
end
```