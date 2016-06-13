system 'clear'
require 'pry'

def numeric?(object)
  true if Float(object) rescue false
end

def get_input(prompt)
  input = nil

  loop do
    puts "--> #{prompt}"
    input = gets.chomp
    break if input.to_f >= 0 && numeric?(input)
  end

  input.to_f.round(2)
end

def calculate_tip(bill, percent)
  (bill * (percent / 100)).round(2)
end

def show_2_decimals(amount)
  sprintf "%.2f", amount 
end

bill = get_input("What is the bill?")
percent = get_input("What is the percent?")
tip = calculate_tip(bill, percent)

puts "the tip is $#{show_2_decimals(tip)}"
puts "the bill is $#{show_2_decimals(bill + tip)}"
