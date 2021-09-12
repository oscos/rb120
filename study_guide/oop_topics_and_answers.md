##### What is OOP and why is it important?

OOP is a programming paradigm that was created to help deal with the growing complexities of large software systems.  As programs grow in size and complexity they become harder to maintain. This is because making a change in one area of the program, affects other areas due to dependencies within the program. 

By implementing the concepts of abstraction, polymorphism, inheritance, and encapsulation, OOP allows the programmer to design more modular, extendable, and reusable code that is easier to maintain, and less fragile.

The software system becomes a type of messaging system by removing dependencies and replacing them with the interaction between components.

* Easier to maintain due to OOPs modular design of seperating data into containers and sectioning on pieces of code that substitues interaction over dependencies.
* Since code is modular it makes it easier to maintain and less fragile when changes are needed.
* Code can easily be extended making it much easier to implement new features.
* Code is reusable allowing the programmer to follow the DRY principle of not repeating snippets of code unecessarily resulting in faster development. 

##### What is encapsulation?

Encapsulation is what defines boundaries within our application and is a form of data protection so that data can't be manipulated or changed without obvious intent.  Encapsulation allows us to hide the internal representation of an object and only expose the methods and properties that users of the application need.


##### How is encapsulation achieved?
Encapsulation is achieved by creating objects and exposing interfaces to interact with those objects. 

##### How does encapsulation work in relation to the public interface of a class?
We use method access control to expose the properties and methods that users need through the public interface (public methods) of a class. 

How is encapsulation demonstrated in this example?

```ruby
class Cat

  def initialize(name)
    @name = name
  end

  def change_name(new_name)
    self.name = new_name
  end

  def greeting
    "Hi, I'm #{name} the #{self.class}!"
  end

  private
  
  attr_accessor :name
end

cat = Cat.new("Sniffles")
cat.change_name("Cleo") 
puts cat.greeting
```

In this example we don't need to know how the `Cat` class or its methods are implmented.  To interact with the object, all we need to know is the required parameters and the name of the public interface we wish to invoke which in this case are `change_name` and `greeting`.

We also use the `private` access modifier to restrict access to the `getter` and `setter` methods of the `name` property.


##### What is polymorphism?

Polymorphism is the ability of objects of different types to respond to a common interface, even when the implementation is different.

##### What are the two primary ways to implement polymorphism?
1. Polymorphism through Inheritance
2. Polymorphism through Duck Typing

Example of Polymorphism through inheritance:
```ruby
class Sport
  def score
  end
end

class Basketball < Sport
  def score
    puts "Toss ball through net"
  end
end

class Soccer < Sport
  def score
    puts "Toss ball in net"
  end
end

[Basketball.new, Soccer.new].each do |s|
   s.score
end
```

Example of Polymorphism through Duck Typing:
```ruby
  class Human
    def move
      puts "I can walk"
    end
  end

  class Airplane
    def move
      puts "I can fly"
    end
  end

  [Human.new, Airplane.new].each do |m|
     m.move
  end
```

##### How does Polymorphism work in relation to the public interface?
The public interface lets us work with objects of different types in the same way even though the implementation cab be dramatically different.

##### What is duck typing? How does it relate to polymorphism - what problem does it solve?
Duck Typing helps keep our code DRY, and less fragile by giving us the ability to invoke the same method name on objects of unrelated types. With duck typing we are not concerned with the class or type of object but rather that the object can respond to the same method invocation.


##### What is a class?
In Ruby a class is where you define the attributes and behaviors for objects.  A class is like a blueprint for objects.  

##### How do you create a class?
You define a class using the reserve word `class` followed by the name of the class using the CamelCase nameing convention, and end the class definition with the reserve word `end`
```ruby
class Animal
end
```

#### What is an object?
In Ruby anything that can be said to hold a value is an object.  Objects represent real world nouns and are created by instantiating a class.

##### How do you create an object?
You instantiate an object from a class by invoking the class method `::new` on the class name. This returns an object which can then be assigned to a variable which can be used to interact with that object.

```ruby
class Animal
end

dog = Animal.new
```

##### What is instantiating?
Instantiation refers to creating an instance of a class also referred to as creating an object from a class.

What is inherit


##### What is lexical scope?
```ruby
"module Maintenance
 def change_tires
 ""Changing #{WHEELS} tires.""
 end
end

class Vehicle
 WHEELS = 4
end

class Car < Vehicle
 include Maintenance
end

a_car = Car.new
a_car.change_tires 
# Describe the error and provide two different ways to fix it."
```

Because of how lexical scope works for constants, when attempting to access a constant within a module you must either declare the constant within the module or specify where to locate the contast using the name space operator `::`.

09/11/2021

More random stuff of Classes and Objects:

```markdown
*  An instance variable is named by the class, but each object created from the class creates its own copy of the instance variable, and its value contributes to the overall state of the object. With this definition, note in particular that the instance variable is actually not part of the class; therefore, it can’t be inherited. The subclass does know about the name, but it’s merely using that name as a handle for the value it contains.

* An attribute is an instance variable name and value. More specifically, an attribute must be accessible outside the methods defined by the class; this means you need either a getter or setter method, or both. If both are missing, you only have an instance variable and a value (you can think of this as a “private attribute” if you want, but it doesn’t really help). An attribute’s getter and setter methods will be inherited by a superclass, but, the instance variable name and value behind the attribute do not participate in inheritance.

* Every object has state. State is the collection of all instance variables and their values defined for an object. Since state is part of the object, not the class, state is not inherited.

The following list should keep you out of trouble, at least for now:
- A subclass inherits the methods of the superclass.
- Instance variables and their values are not inheritable.
- Attribute getters and setters are methods, so they are inheritable
- Attribute names and their values are just instance variables and values, so they are not inheritable
- State is a tied directly to individual objects, so is not inheritable.
```






Classes in ruby is where we define the attributus and behaviors for objects.  Classes act like blueprints from which objects are created from.  The process of creating an object from a class is called instantiation this involves invoke the `new` class methon 


##### From Slack ####
How to approach each concept when asked to explain.
- Approach each problem on interview assessment with a condensed definition of a topic.
- Have a concise code example to demonstrate the topic ready in your head.
- Expect follow up questions.

We also covered the following topics.
Classes and Objects
  - Classes are blueprints for objects made up of behaviors (what an object should be able to do) and attributes (what an object should be made of or it's state)
  - Make sure to include examples of what an attribute and behavior is in code.
Getters and Setters
  - Getters and Setters provider an interface to the object's state.
  - Understand the differences between invoking a getter method with `self` prepended in Ruby        version 2.65 and 2.7 (the test will be in 2.65)
   - You can't call getter methods in 2.65 with `self` prepended.
   - You must use `self` when invoking setter methods in both versions.
Encapsulation
  - Allows us to only expose the attributes and behaviors that users of the object need by allowing us to hide the internal representation of an object.
  - Follow up question: What are the difference between private and protected methods?
Protected methods
  - When a method is protected, only instances of the class (objects) **or a subclass** can call the method from inside the class. This makes sharing sensitive information between instances of the same class very easy. From inside the class, a protected method is accessible just like `public` methods. From outside the class, a `protected` method cannot be called.Polymorphism
  - When different objects respond differently to the same message.

##### End Slack ######
