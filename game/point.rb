class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_a
    [@x, @y]
  end
end

class Direction < Point
  def initialize(x,y)
    vector = Vector[x,y]
    return super if vector.magnitude == 1
    super(x / vector.magnitude, y / vector.magnitude)
  end
end
