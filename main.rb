require 'pry'


class A
  def self.enable_something(boolean=nil)
    @@enable_something = boolean || @@enable_something
  end
end

class B < A
  enable_something true
end

p B.enable_something
