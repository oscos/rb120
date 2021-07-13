# # Classes and objects

# # Class inheritance, encapsulation, and polymorphism

# # Referencing and setting instance variables vs. using getters and setters

# # Use attr_* to create setter and getter methods
# # How to call setters and getters?

# # Instance methods vs. class methods

# # Method Access Control

# # Modules

# # Method lookup path
    
# # self
# # Calling methods with self
# # More about self

# # Reading OO code

# # Fake operators and equality

## Truthiness

## Working with collaborator objects




## Classes and objects
- Classes is where you define the attribute and behaviors for objects.  Its where you define what an object is made of and what it can do.  A class is like an abstract blueprint from which you create concrete objects from.  

- Objects are instances of classes and represent real world nouns.   Anything that can be said to have a value is an object in ruby. 
   !IMPORTANT: You return an object by calling the class method new on a class. You instatiate an object called X from class Y 
   While the attributes are defined in classes, its not until you instatiate an object from a class that you assign a value to those attributes. Individual objects will contain different information from other objects, yet they are instances of the same class.

>  Classes encapsulate methods.  Objects encapsulate attributes. All Attributes (instance methods and the values) comprise the state of an object.

Example:
Let's say we have a car class where you define the attributes model, color, and year. 
```ruby
   class Car
      def initialize(model, color, year)
         @model = model
         @color = color
         @year  = year
      end
   end
   
   my_car = Car.new("Mazda 6", "Blue", 2015)
   p my_car
```

## Class and Objects

#### Classes
* A class in Ruby is like a blueprint where you define the attributes and behaviors for objects.  Its where you define what an object is made of and what it can do.  
* Classes encapsulate methods. Since methods are part of the class, they are inherited by the subclasses of the superclass. In Ruby a subclass can only inherit from one superclass, however you can include additional additional methods in any class via module mixins.
    
#### Objects
* Objects are created from classes. When you instantiate an object from a class you create an instance of that class.  Anything that can be said to hold a value is an object in ruby.  Objects represent real world nouns.  

* Objects encapsulate state which is the collection of all instance variables and their values. Since state is part of the object it is not inherited.  The state of any two objects will be different even if they are instantiated from the same class.

  [Attributes vs State](https://launchschool.com/posts/c279b82b)
  [Attributes, States, and Behaviors Identification](https://launchschool.com/posts/2de34d40)
  [What are Objects?](https://launchschool.com/books/oo_ruby/read/the_object_model#whatareobjects)
  
  

# # How to call setters and getters?

- This is Ruby's way of making it easier on the programmer to create getter and setter methods
    - getters are instance methods that get or reads the value of instance variables
    - setters are instance methods that set or update the value of instance variables
        - attr_accessor: creates both instance setter and instance getter, 
        - attr_writer create only setter instance method 
        - attr_reader creates only getter instance method

- Is this referring to using it inside of the class or outside of the class
- Inside of the class you would call self.getter_name or self.setter_name
- You invoke a method on an instance of a class (object)
    ```ruby
    class MyClass
        attr_accessor :name
        def initialize(name)
        end
    end
    
    obj = MyClass.new
    obj.getter_method_name
    obj.setter_method_name("some parameter")
    ```


# # Instance methods vs. class methods
    - Class methods are methods that we can call on the class itself than having to instantiate an object.

# # Method Access Control
 - Public, Private, Protected
 - 

