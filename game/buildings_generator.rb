class BuildingsGenerator
  def self.generate(window)
    buildings = []
    Random.rand(200).times do
      buildings << Building.new(window.random_location)
    end
    buildings
  end

end

class Building
  def initialize(center)
    radius = 3
    @center = center
    @x_min = center.x - radius
    @x_max = center.x + radius
    @y_min = center.y - radius
    @y_max = center.y + radius

    @color = Gosu::Color::BLACK
  end

  def draw(window)
    window.draw_quad(@x_min, @y_min, @color,
                     @x_min, @y_max, @color,
                     @x_max, @y_min, @color,
                     @x_max, @y_max, @color
                    )
  end
end
