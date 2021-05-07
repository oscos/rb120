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

# # Truthiness

# # Working with collaborator objects




### Classes and objects
- Classes is where you define the attribute and behaviors for objects.  A class is like an abstract blueprint from which you create concrete objects from.
- Objects are instances of classes and represent real world nouns.   Anything that can be said to have a value is an object in ruby. 
   !IMPORTANT: You return an object by calling the class method new on a class. You instatiate an object called X from class Y 
   While the attributes have been defined, its not until you instatiate an object from this class that you assign a value to those attributes.

* Mental Model: You can think of a class as an abstract blueprint from which you create concrete and specific objects from.  Individual objects may contain different information from other objects yet be instances of the same clase.
While the attributes hare defined in a class, its not until you instatiate an object from this class that you assign a value to those attributes.

>  Classes encapsulate methods.  Objects encapsulate attributes.

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

