class Rectangle
  attr_reader :area

  def initialize(height, width = height)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end

  def to_s
    puts "area of #{self.class} is #{area}"
  end
end

class Square < Rectangle
end

square = Square.new(5)
puts square.to_s 

rectangle = Rectangle.new(5, 6)
puts rectangle.to_s 
