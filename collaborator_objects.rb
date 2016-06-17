class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def list_pets
    pets.each do |pet|
      puts pet.name
    end
  end
end

module Legs
end
 
module Speak
end

class Pets
  attr_accessor :name, :breed

  include Legs, Speak
  include Speak

  def initialize(name, breed)
    @name = name
    @breed = breed
  end
end

class Dog < Pets
end

class Cat < Pets
end

bob = Person.new 'Robert'
spike = Dog.new 'Spike', 'Bulldog'
missy = Cat.new 'Missy', 'Domestic'
bob.pets << spike
bob.pets << missy 
bob.list_pets

p Pets.ancestors
