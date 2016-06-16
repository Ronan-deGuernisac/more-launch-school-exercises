require 'pry'
def missing(array)
  start = array.first
  stop = array.last
  result = []
  (start..stop).each do |number|
    result << number if !array.include? number
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

def missing2(array)
  result = []
  array.each_cons(2) do |first, second|
    binding.pry
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []
