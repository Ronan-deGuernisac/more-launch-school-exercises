class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def initialize(make, model, wheels)
    super(make, model, 4)
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super(make, model, 2)
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, 2)
    @payload = payload
  end
end

truck = Truck.new("ford", "F150", "2 tons")

p truck.payload
p truck.make
p truck.model
