age = rand(20..200)
name = nil

loop do
  system 'clear'
  puts "enter a name:"
  name = gets.chomp
  break unless name.length == 0
end

puts "#{name} is #{age} years old!"
