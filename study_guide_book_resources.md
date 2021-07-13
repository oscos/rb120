## Classes and Objects

### [Why OOP?](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming) (modified)
* Object Oriented Programming, often referred to as OOP, is a programming paradigm that was created to deal with the growing complexity of large software systems. Programmers found out very early on that as applications grew in complexity and size, they became very difficult to maintain. One small change at any point in the program would trigger a ripple effect of errors due to dependencies throughout the entire program.

* Programmers needed a way to create containers for data that could be changed and manipulated without affecting the entire program. They needed a way to section off areas of code that performed certain procedures so that their programs could become the interaction of many small parts, as opposed to one massive blob of dependency.

#### [Encapsulation](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)
* is hiding pieces of functionality and making it unavailable to the rest of the code base. 
* It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. 
* It is what defines the boundaries in your application and allows your code to achieve new levels of complexity. 
* Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.
* Another benefit of creating objects is that they allow the programmer to think on a new level of abstraction. 
* Objects are represented as real-world nouns and can be given methods that describe the behavior the programmer is trying to represent

#### [Polymorphism ](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)
* the ability for different types of data to respond to a common interface.
* It lets objects of different types respond to the same method invocation.
* "Poly" stands for "many" and "morph" stands for "forms". OOP gives us flexibility in using pre-written code for new purposes.
* [Inheritance](https://launchschool.com/books/oo_ruby/read/the_object_model#:~:text=The%20concept%20of-,inheritance,-is%20used%20in) -  a class inherits the behaviors of another class, referred to as the superclass. This gives Ruby programmers the power to define basic classes with large reusability and smaller subclasses for more fine-grained, detailed behaviors

* [Mixins](https://launchschool.com/books/oo_ruby/read/the_object_model#:~:text=This%20is%20called%20a-,mixin,-.%20After%20mixing%20in) - Another way to apply polymorphic structure to Ruby programs is to use a Module. Modules are similar to classes in that they contain shared behavior. However, you cannot create an object with a module. A module must be mixed in with a class using the include method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

### [What are Objects](https://launchschool.com/books/oo_ruby/read/the_object_model#whatareobjects)
* not everything in Ruby is an object. 
* However, anything that can be said to have a value is an object: 
* that includes numbers, strings, arrays, and even classes and modules. 
* However, there are a few things that are not objects: methods, blocks, and variables are three that stand out.

### [Classes Define Objects](https://launchschool.com/books/oo_ruby/read/the_object_model#classesdefineobjects)
* Ruby defines the attributes and behaviors of its objects in classes. 
* You can think of classes as basic outlines of what an object should be made of and what it should be able to do. 
####  [Instantiation](https://launchschool.com/books/oo_ruby/read/the_object_model#:~:text=class%20is%20called-,instantiation,-%2C%20so%20we%20can)
* we can also say that we've instantiated an object called sparky from the class GoodDog
*  the important fact here is that an object is returned by calling the class method new
  ```ruby
  class GoodDog
  end

  sparky = GoodDog.new
  ```

[Modules](https://launchschool.com/books/oo_ruby/read/the_object_model#modules)
* modules are another way to achieve polymorphism in Ruby
* A module is a collection of behaviors that is usable in other classes via mixins. A module is "mixed in" to a class using the include method invocation
  ```ruby
    module Speak
      def speak(sound)
        puts sound
      end
    end

    class GoodDog
      include Speak
    end

    class HumanBeing
      include Speak
    end
  ```

### [Method Lookup](https://launchschool.com/books/oo_ruby/read/the_object_model#methodlookup)
* Ruby has a distinct lookup path that it follows each time a method is called.
* We can use the ancestors method on any class to find out the method lookup chain.
  ```ruby
    module Speak
      def speak(sound)
        puts "#{sound}"
      end
    end
    class HumanBeing
      include Speak
    end

    puts HumanBeing.ancestors 

    # ---HumanBeing ancestors---
    # HumanBeing
    # Speak
    # Object
    # Kernel
    # BasicObject
  ```
* Method lookup chain works when working with both mixins and class inheritance.
* This means that since the speak method is not defined in the GoodDog class, the next place it looks is the Speak module. 
* This continues in an ordered, linear fashion, until the method is either found, or there are no more places to look.




#### [States and behaviors](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#statesandbehaviors)
* We use classes to create objects. When defining a class, we typically focus on two things: states and behaviors. States track attributes for individual objects. Behaviors are what objects are capable of doing
* instance variables are scoped at the object (or instance) level, and are how objects keep track of their states
* We define these behaviors as instance methods in a class. Instance methods defined in a class are available to objects (or instances) of that class.
* In summary, instance variables keep track of state, and instance methods expose behavior for objects. 

#### [Initializing a New Object](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#initializinganewobject)
* The initialize method gets called every time you create a new object.
* calling the new class method eventually leads us to the initialize instance method.
* We refer to the initialize method as a constructor, because it gets triggered whenever we create a new object.

#### [Instance Variables](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#instancevariables)
* an instance variable is a variable that exists as long as the object instance exists and it is one of the ways we tie data to objects. It does not "die" after the initialize method is run. It "lives on", to be referenced, until the object instance is destroyed.
* instance variables are responsible for keeping track of information about the state of an object.
* Every object's state is unique, and instance variables are how we keep track.

#### [Instance Methods](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#instancemethods)
* all objects of the same class have the same behaviors, though they contain different states
* In our instance methods, we have access to instance variables.
* we can expose information about the state of the object using instance methods.

#### [Accessor Methods](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#accessormethods)
 
 * getter methods only job is to return the value in the instance variable
 * if we wanted to change sparky's name? That's when we reach for a setter method
 
 * Ruby recognizes that this is a setter method and allows us to use the more natural assignment syntax: sparky.set_name = "Spartacus". When you see this code, just realize there's a method called set_name= working behind the scenes, and we're just seeing some Ruby syntactical sugar.
 
* as a convention, Rubyists typically want to name those getter and setter methods using the same name as the instance variable they are exposing and setting. 
* Setter methods always return the value that is passed in as an argument, regardless of what happens inside the method. If the setter tries to return something other than the argument's value, it just ignores that attempt.
  ```ruby
  class Dog
    def name=(n)
      @name = n
      "Laddieboy"              # value will be ignored
    end
  end

  sparky = Dog.new()
  puts(sparky.name = "Sparky")  # returns "Sparky"
  ```




# #polymporphism - refers to the ability of objects of different types to respond to a common interface even when their implementation is different.
  
# # poly through class inheritance

#   class Animal
#     def speak
#     end
#   end

#   class Dog < Animal
#     def speak
#       puts "woof"
#     end
#   end
  
#   class Cat < Animal
#     def speak
#       puts "meow"
#     end
#   end

#   class Coral < Animal
#   end

#   dog = Dog.new
#   dog.move
  
#   cat = Cat.
# # poly through interface inheritance
# # poly through duck typing
  


class Dog
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
end

puppy = Dog.new('Benji')
another_puppy = Dog.new('Benji')

# What will this output? Why?

p puppy.name == another_puppy.name # true


# Example two
# Intros
# RB129 Assessment
# - Assessment Format
# - Preparing for the Assessment
# Conceptual Questions
# Code-based questions
# Any other questions

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    super()
    puts "How are you today?"
  end
end

child = Child.new
child.hello('Bob')

# Hello, World
# How are you today?