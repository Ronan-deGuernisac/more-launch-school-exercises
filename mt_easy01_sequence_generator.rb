def step(start, stop, step)
  x = start
  while x <= stop
    yield x
    x += step
  end
  Range.new(start, stop)
end

step(1, 10, 4) { |value| puts "value = #{value}"}
