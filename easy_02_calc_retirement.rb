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

  input.to_i
end

def current_year
  Time.new.year
end

def retirement_year(age, ret_age)
  current_year + ret_age - age
end 

current_age = prompt_for_input("What is your age?")
retirement_age = prompt_for_input("What is your retirement age")
retirement_yr = retirement_year(current_age, retirement_age)

puts "It's #{current_year}. You will retire in #{retirement_yr}"
puts "You have only #{retirement_yr - current_year} years until retirement!"
