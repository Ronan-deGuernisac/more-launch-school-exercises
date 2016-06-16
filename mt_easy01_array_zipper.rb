# method mimicing the functionality of array#zip
require 'pry'

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << Array.new([array1[index], array2[index]])
    index += 1
  end
  result
end

new_array = zip([1, 2, 3], [4, 5, 6])
p new_array
