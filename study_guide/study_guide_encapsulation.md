### Class inheritance, encapsulation, and polymorphism

09/02/2021 @ 06:00

Encapsulation is how we define boundaries in our application that makes certain functionality unavailable from the rest of the codebase. This protects data from unintentional modification or manipulation.

In Ruby we achieve encapsulation by creating objects and exposing interfaces to interact with those objects.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Bob")
puts bob.name
```
> We expect our code to output "Bob", instead it raises and error.  Why?  What does this demonstrate about how to achieve encapsulation

Encapsulation lets us hide the internal representation of objects from the outside and only expose the methods and properties that the client needs. In Ruby, we achieve encapsulation by creating objects and exposing interfaces to interact with those objects.  

Although on `line 7` we instantiate a `Person` object and assign it to `bob`, we never expose a public interface for our class which is needed to interact with objects of the class. Thus on `line 8`, when we invoke `name` on the object referenced by `bob`, Ruby raises an error instead.
    
To fix this code we can define the `attr_reader`  accessor method with `name` as an argument, `attr_reader :name`, which automatically creates the public `name` getter method which we can use to interact with our object.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Bob")
puts bob.name
```

# Method Access Control

Through encapsulation, we can hide the internal representation of an object, and only expose the necessary methods and properties that the client needs access to.  We do this by implementing Method Access Control that qualifies methods as public, private or protected which determines what methods and properties are exposed through the public interface of a class.

```ruby
class Person
  attr_reader :name

  def initialize(name)
      @name = name
  end

  def greeting
      puts "Hello, #{@name}!"
  end

end

bob = Person.new("Bob")
tom = Person.new("Tom")

bob.greating
tom.greeting

puts bob.name
puts tom.name
```