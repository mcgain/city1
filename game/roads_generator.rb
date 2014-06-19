class RoadsGenerator
  def self.generate(window)
    road_start = Point.new(Random.rand(window.width), 0)
    road_end = Point.new(Random.rand(window.width), window.height)
    [Road.new(road_start, road_end)]
  end
end

class Road
  def initialize(road_start, road_end)
    @start = road_start
    @end = road_end
  end

  def draw(window)
    color = Gosu::Color::GRAY
    window.draw_line(@start.x, @start.y, color, @end.x, @end.y, color)
  end
end
