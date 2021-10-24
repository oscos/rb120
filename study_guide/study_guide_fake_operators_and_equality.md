# Fake Operators and Equality

Created 09/28/2021

### Equivalence

Below are four ways to check for equality in Ruby

`==` 
- Athough for most objects, the `==` is used to compare the values of the objects, how objects are compared for equivalence is determined by the class that the objects belong to. This is because the operator `==` is actually a method.  Most built-in Ruby classes like `String`, `Integer`, `Array` provide their own `==` method. This is because by default, BasicaObject's (parent class for all object) version of `BasicObject#==` does not perform an equality check but instead checks to see if two objects are the same object.  When comparing custom objects, you should define your own `==` method.


`equal?` 
- In addition to checking whether or not two objects have the same value, the `equal?` method also checks to see if the two objects are the same (occupy the same space in computer memory).  It's similar to invoking the object_id method in order to compare between two objects.  For this reason, this method should not be overwritten in your custom classes.


`===` 
- The `===` treats the calling object as a group and proceeds to check whether or not the comparing object belong to the group.  This method is used implicitly by case statements and rarely does one need to call this method explicitly.  This method should only be overwritten if one anticipates our custom objects will be used in case statements.


`eql?` 
- In addition to checking whether or not two objects have the same value, the `eql?` method also checks to see if the two objects belong to the same class.  This method is implicity used by Hashes and is rarely used implicitly.

```ruby
str1 = "Hello"
str2 = "Hello"  
str3 = "HHelloo"
str1_copy = str1

str4 = 5
str5 =  5.0

p str1 == str2 #
puts ""

str1.object_id == str1_copy.object_id

p str1.equal?(str2) # 
p str1.equal?(str1_copy) # 
puts ""

p str1 === str2 # 
p str1 === str3 #  
puts ""

p str4.eql?(str5) # 
puts "
```