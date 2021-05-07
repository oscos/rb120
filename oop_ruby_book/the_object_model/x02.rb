# What is a module? What is its purpose? How do we use them with our classes? 
# Create a module for the class you created in exercise 1 and include it properly.

# A module is simlar to a class in that you use it to group together methods
# that can then be added to a class via mix ins using the `include` method.
# This gives objects of that class additional functionality by being able to
# respond to additonal methods.

# x02.rb

module Speak
end

class MyClass
   include Speak
end 

object_one = MyClass.new
p object_one
