def compute
  if block_given?
    yield
  else
    "Does not compute"
  end
end

p compute {3+4}
p compute

def compute2(argument = nil)
  if block_given?
    yield argument
  else
    "does not compute"
  end
end

p compute2(3)
p compute2(3) {4+5}
p compute2(9) {|value| value * value }
