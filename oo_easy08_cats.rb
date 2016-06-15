class Pet
  attr_reader :name, :age, :color

  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end

  def to_s
    "My #{self.class.to_s.downcase} is #{age} years old and has #{color} fur"
  end
end

class Cat < Pet
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
