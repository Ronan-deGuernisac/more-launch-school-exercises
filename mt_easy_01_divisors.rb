def divisors(number)
  result = []
  (1..number).each do |divisor|
    result << divisor if number % divisor == 0
  end
  result

end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]

include Math
def divisors2(number)
  limit = sqrt(number).to_i
  result = []
  (1..limit).each do |divisor|
    result << divisor if number % divisor == 0
    result << number / divisor if divisor == number / divisor.to_f
  end
  result
end

p divisors2(999962000357)
p divisors2(999962000357) == [1, 999979, 999983, 999962000357]
