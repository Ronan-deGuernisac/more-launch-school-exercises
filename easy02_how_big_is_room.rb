system 'clear'
puts "calculate room area"

SQMETERS_TO_SQFEET = 10.7639

def get_input(type)
  input = nil
  loop do
    puts "enter the #{type} in meters:"
    input = gets.chomp.to_f
    break unless input <= 0
  end
  input
end

def area_in_meters(length, width)
  (length * width).to_f.round(2)
end

def area_in_feet(area)
  (area * SQMETERS_TO_SQFEET).round(2)
end

length = get_input("length")
width = get_input("width")
area_meters = area_in_meters(length, width)

puts "the area of the room is #{area_meters} square meters (#{area_in_feet(area_meters)} square feet)"


