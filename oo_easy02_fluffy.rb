require 'pry'

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

name = 42
fluff = Pet.new(name)
name += 1
puts fluff.name
puts fluff
puts fluff.name
puts name
