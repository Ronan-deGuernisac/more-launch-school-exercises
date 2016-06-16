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

def zip2(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

new_array2 = zip2([1, 2, 3], [4, 5, 6])
p new_array2

def zip3(array1, array2)
  result = []
  index = 0
  while index < array1.size
    result << array1[index] << array2[index]
    index += 1
  end
  result
end

new_array3 = zip3([1, 2, 3], [4, 5, 6])
p new_array3
