# RB129 Practice Problems
>Description: Student list of Practice Problems to help prep for RB129.  Original list found here: https://docs.google.com/document/d/10JvX-ArkfF8fIWQu8wPaYt7JJHrv_5E0gM0I2uPirwI/edit#

<br />

### Problems To Revise:
| Exercise | Description |
| --- | ----------- |
| #3 | Revise the `why?` responses. |
| #6 | Incomplete. `name = name.upcase` |


## Ex #1
What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
``` 

This code demonstrates a distinction between referencing local variables and instance variables. While referencing an uninitialized local variable raises a `NameError` error, referencing an uninitialized instance variable returns `nil`.

On `line 9`, we invoke the `::new` class method on a `Person` class which returns an object that's assigned to the local variable `bob`.

On `line 10`, we invoke the `name` instance method on the object referenced by `bob` which returns `nil` and outputs `nil`.

To initialize an instance variable, we must first call the method that initializes the variable. Since the `set_name` instance method is never invoked, the `@name` instance variable is not initialized and returns `nil` when referenced.  

<br />
<hr />

## Ex #2
What is output and why? What does this demonstrate about instance variables?

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```

This code demonstrates a distinction between referencing local variables and instance variables. Referencing an uninitialized instance variable returns `nil`. However referencing an uninitialized local variable raises a `NameError` error instead.

On `line 15`, we invoke the `::new` class method on a `Dog` class which returns an object that's assigned to the local variable `teddy`.

On `line 16` we invoke the `swim` instance method on the object referenced by `teddy`, which returns `nil` and outputs `nil`. 

This is because the `enable_swimming` instance method that initializes the `@can_swim` instance variable is never invoked and `@can_swim` is not initialized.

Since uninitialized instance variables return `nil`, `@can_swim` returns `nil` when it's referenced within the if conditional statement on `line 11`. This in turn causes the `if` statement to evaluate to `false` and return `nil`. Since it's the last evaluated expression within the `swim` method, `swim` also returns `nil`.

<br />
<hr />

## Ex #3

What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above

```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides  # Square < Quadrilateral (Constant) < Shape ()
p Square.new.sides 
p Square.new.describe_shape 
```

This code demonstrates that constants have lexical scope. It also demonstrates that a constant initialized in a superclass is inherited by the subclass, and can be accessed by both class methods and instance methods.

On `line 25`, we invoke the `sides` class method on the `Square` class which returns `4` and outputs `4`. 
    Why?
    - It has access to the `SIDES` class method through inheritance.
    - The qualifying namespace for the constant is valid and can be resolved.

On `line 26`, we invoke the `sides` instance method on an a `Square` object, which returns `4` and outputs `4`.
    Why?
    - It has access to the `SIDES` instant method through inheritance.
    - The qualifying namespace for the constant is valid and can be resolved.

On `line 27`, we invoke the `describe_shape` instance method on a `Square` object. Since the `SIDES` constant is referenced within this method without a qualifying namespace, Ruby checks the enclosing module - the `Describable` module, to see if it defines the constant. Since it doesn't find it, Ruby raises a `NameError` error. Within the `describe_shape` method, `self` refers to the `Square` object.


<br />
<hr />

## Ex #4
What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?
```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
```

This code outputs an array of `Animal` objects which is not what we would expect when using the `AnimalClass#+`.

When we add two objects together, we expect the evaluated statement to return an object of the same class.  For example, when adding two `Number` objects, `2` and `4`, we expect the evaluated statement to return a `Number` object.  Similarly if we add two `String` objects, `"Hello"` and `"World"`, we expect the evaluated statement to return a `String` object. Since in this case we are adding two `AnimalClass` objects, we expect the evaluated statement to return an `AnimalClass` object but instead it returns and outputs an `Array` object.

We can modify the `AnimalClass#+` method so that the return value is more in line with what we expect by adding a `my_animals` local variable that references an instantiated `AnimalClass` object.  We can then invoke the `AnimalsClass#animals` method to set the `@animals` instance variable to the return value of `animals + other_class.animals`. Finally we can define the `my_animals` local variable as the last line in the `AnimalClass#+` method which will be it's return value when invoked.

Code modified from:
```ruby
def +(other_class)
  animals + other_class.animals
end
```

Code modified to:
```ruby
def +(other_class)
  my_animals = AnimalClass.new("My Animals")
  my_animals.animals = animals + other_class.animals
  my_animals
end
```

<br />
<hr />

## Ex #5
We expect the code below to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

This code demonstrates that `setter` methods must be prepended with `self` to help Ruby disambiguate between invoking a `setter` method and initializing a local variable.

On `line 22` we invoke the `::new` class method on `GoodDog` class which instantiates a new `GoodDog` object and passes through the arguments `'Spartacus', '12 inches', '10 lbs'` to the initialize method. This new object is assigned to the local variable `sparky`.

On `line 23`, we invoke the `change_info` instance method on a `GoodDog` object referenced by `sparky` and pass in the arguments `'Spartacus', '24 inches', '45 lbs'`. Within this method, rather than invoking the setter methods `name=`, `height=`, and `weight=`, Ruby instead initializes three new local variables `name`, `height`, and `weight` to the values of the arguments passed in.

To let Ruby know we're calling setter methods and not creating local variables, we can modify the code within `change_info` method by prepending `self` as an explicit caller to `name=`, `height=`, and `weight=`. 

Code modified from:
```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

Code modified to:
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

<br />
<hr />

## Ex #6
In the code below, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name
```

This code demonstrates that `setter` methods must be prepended with `self` to help Ruby disambiguate between invoking a `setter` method and initializing a local variable.

On `line 13` we invoke the `::new` class method on `Person` class which instantiates a new `Person` object and passes through the string `Bob` as an argument to the initialize method. This new object is assigned to the local variable `bob`.

On `line 14`, we invoke the `name` instance method on the object referenced by `bob` which outputs `Bob` and returns `nil`.

On `line 15`, we invoke the `change_name` instance method on the object referenced by `bob`.  Within this method, rather than invoking the `name=` setter method, Ruby instead creates a local variable `name` that then shadows the `name` getter method which Ruby evaluates to `nil`. This is why when the `upcase` method is invoked on the `name` getter method, it raises a `NoMethodError` error.

To fix this error, on `line 9,` we can prepend `self` as the explicit caller on the `name=` setter method.  This tells Ruby we are invoking a setter method and not creating a local variable. 

With this modification in place when we invoke `name` on the object referenced by `bob` on line 16, it will return `nil` and output `BOB`.

Code modified from:
```ruby
def change_name
  name = name.upcase
end
```

Code modified to:
```ruby
def change_name
  self.name = name.upcase
end
```

<br />
<hr />

## Ex #7
What does the code below output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels  
```

This code demonstrates that in the context of inheritance, class variables can behave in unexpected and even dangerous ways. This is because when a class variable is defined within a class, there is only one copy of that class variable across all sub-classes and all instances of the classes in the inheritance chain. This means that if we override a class variable from within a sub-class, it will affect the class variable in the super class and all other sub-classes further down the inheritance chain.

On `line 9`, we invoke the `wheels` class method on a `Vehicle` class which outputs `4`. This is because within `Vehicle` on `line 2`, the `@@wheels` class variable has been initialized to `4`.

On `line 15`, we invoke the `wheels` class method on a `Motorcycle` sub-class that inherits from `Vehicle` which outputs `2`. This is because within `Motorcycle` on `line 12`, we override the `@@wheels` class variable and set its value to `2`. 

This affects the `@@wheels` class variable in the `Vehicle` super class and all other sub-classes further down the inheritance chain.  

This is why when on `lines 16, and 20` we invoke the `wheels` class method on the `Vehicle` super class , the output is `2`. 

It's also why when on `line 22` we invoke the `wheels` class method on the `Car` sub-class, the output is `2`.