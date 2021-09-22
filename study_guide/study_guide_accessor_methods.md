# Accessor Methods
# Created On: 09/18/2021

Accessor methods are instance methods that allows access the to value that an instance variable references in order to expose or change an object's state. There are two types of accessor methods

* The `getter` methods The getter method returns the value referenced by the instance variable.
* The `setter` methods sets or reassigns the value of an instance variable. 

By convention getter and setter methods are named after the instance variable they change or expose. 

```ruby
class Customer

  def initialize(name)
    @name = name
  end

  # getter method
  def name
    @name
  end

  # setter method
  def name=(n)
    @name = n
  end
end

oscar = Customer.new("Oscar")
puts oscar.name # => "Oscar"
oscar.name = "Carlos"
puts oscar.name #=> "Carlos"
```

Because creating getter and setter methods is such a common task, Ruby provides the `attr_*` as way to automatically create the methods for us.

* The `attr_reader` takes in a symbol as an argument and creates a `getter` method with the same name as the argument
* The `attr_writer` takes in a symbol as an argument and creates a `setter` method with the same name as the argument
* The `attr_accessor` takes in a symbol as an argument and creates a `setter` method with the same name as the argument

Setter methods must be invoked with the `self` keyword prepended to the setter method name. This tells ruby we are invoking a setter method and not creating a local variable. Although getter methods do not require `self` prepended to the method name, you may want to use this syntax for consistency purposes.

```ruby
class Customer
  # attr_reader :name # automatically creates `name` getter method
  # attr_writer :name # automatically creates `setter` method
  attr_accessor :name # automatically creates both `getter` and `setter` methods
  def initialize(name)
    @name = name
  end
end

oscar = Customer.new("Oscar")
puts oscar.name # => "Oscar"
oscar.name = "Carlos"
puts oscar.name #=> "Carlos"
```