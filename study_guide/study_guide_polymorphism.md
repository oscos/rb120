### Class inheritance, encapsulation, and polymorphism

09/10/2021 @ 05:30

Polymorphism is the ability of objects of different types to respond to a common interface, even if the implementation may be different. Interface Inheritance, and Duck Typing are two primary ways to implement polymorphism.

**Example of Polymorphism through Inheritance:**
```ruby
class Player
  def pass
    puts "Do nothing"
  end
end

class BasketballPlayer < Player
  def pass
    puts "Throw ball"
  end
end

class SoccerPlayer < Player
  def pass
    puts "Kick ball"
  end
end

class CardPlayer < Player
end

players = [BasketballPlayer.new, SoccerPlayer.new, CardPlayer.new]
players.each do |player|
  player.pass
end
```
In this example, the public interface of this class hierachy allows for different type of objects to respond to the same method invocation through inheritance.  Here, the classes `BasketballPlayer`, `SoccerPlayer`, and `CardPlayer`, all inherit the `pass` method from the `Player` class.  And although the `BasketballPlayer` class and the `SoccerPlayer` class both override the `pass` method, with each having their own implementation, this demonstrates `Polymorphism through Inheritance` since the objects of all three subclasses can respond to the same method invocation. 

**Example of Polymorphism through Duck Typing:**
```ruby
class Person
  def run
    puts "I run on 2 legs"
  end
end

class Dog
  def run
    puts "I run on 4 legs"
  end
end

runners = [Person.new, Dog.new]
runners.each do |runner|
    runner.run
end
```
In this example, the public interface of each class allows for the different type of objects to respond to the same method invocation through Duck Typing. With Duck Typing we are not concerned with the object's type or what class it belongs to, instead we only care that the object has the ability to respond to the same method invocation. Here both the `Person` class and the `Dog` class both have a `run` method. And although each class has their own method implmentation, this demonstrates `Polymorphism through Duck Typing` since the objects of both classes can respond to the same method invocation.