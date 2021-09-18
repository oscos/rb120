# Modules

Modules are containers used to group methods as well as classes. Three use cases for modules are `mixins`, `namespacing`, and `method modules`.

`mixins` - Some languages allow for multiple inheritance as it can help to accurately model a problem domain.  While in Ruby, a class can only inherit from one super class, we can add in as many modules as necessary into a class using `mixins`.  With `mixins`, common behavior that doesn't fit into a hierarchy system is grouped within a module which acts like a container. The module can then be mixed into a class where such behavior is useful, via the `Module#include` method.  Since the class inherits the interface of the module, the instance methods defined within the module can be used by both the class, and objects of the class. 

`namespacing` - With `namespacing`, modules are used to group similar classes together, making it easier to identify related classes in our code, and also avoids collision between other similarly named classes in our codebase.

`module methods` - With `module methods`, modules are used as containers to group methods that seem out of place within our code.

**mixins Example**
```ruby
module Chargeable
  def charge_services
    puts "Charge for services rendered"
  end
end

class Customer
end

class Contractor
  include Chargeable
end

class Inspector
  include Chargeable
end

[Contractor.new, Inspector.new].each do |entity|
  entity.charge_services
end
```

**namespacing**
```ruby
module Contractor
  class Plumber
    def shutoff_water
      puts "shut off water"
    end
  end
  
  class Electrician
    def shutoff_power
      puts "shut off power"
    end
  end
end

plumber = Contractor::Plumber.new
electrician = Contractor::Electrician.new

plumber.shutoff_water
electrician.shutoff_power
```

**module methods**
```ruby
module ServiceProvider
  def self.synchronize
    puts "Some out of place method"
  end
end

ServiceProvider.synchronize
ServiceProvider::synchronize
```