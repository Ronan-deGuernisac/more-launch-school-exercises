system 'clear'

def numeric?(object)
  true if Float(object) rescue false
end

def prompt_for_input(prompt)
  input = nil

  loop do
    puts "==> #{prompt}:"
    input = gets.chomp
    break if numeric?(input)
  end

  input
end

def retirement_year(age, ret_age)
end 

current_age = prompt_for_input("What is your age?")
retirement_age = prompt_for_input("What is your retirement age")

puts "It's "
