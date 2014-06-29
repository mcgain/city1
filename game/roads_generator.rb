require 'matrix'

class RoadsGenerator
  def self.generate(window)
    main_road = generate_main_road(window)
    roads = [main_road]
    Random.rand(50).times do
      roads << road_based_on(roads.last)
    end
    roads
  end

  def self.road_based_on(base_road, window = nil)
    start = random_point_on_road(base_road)
    start_direction = base_road.vector[-2..-1]
    x = start_direction[1]
    y = start_direction[0] * -1
    road = Road.from_point_and_direction(start, Direction.new(x,y))
    road
  end

  def self.random_point_on_road(road)
    factor = Random.rand
    Point.new(
      (1 - factor) * road.start.x + factor * road.end.x,
      (1 - factor) * road.start.y + factor * road.end.y
    )
  end

  def self.generate_main_road(window)
    road_start = Point.new(Random.rand(window.width), 0)
    road_end = Point.new(Random.rand(window.width), window.height)
    Road.new(road_start, road_end)
  end
end

class Road
  attr_reader :start, :end, :vector
  def initialize(road_start, road_end)
    @start = road_start
    @end = road_end
    foo = @start.to_a + (Vector.elements(start.to_a) - Vector.elements(@end.to_a)).to_a
    @vector = Vector.elements((foo).flatten)
  end

  def self.from_point_and_direction(start, direction)
    length = Random.rand(200)
    x = start.x + direction.x * length
    y = start.y + direction.y * length
    Road.new(start, Point.new(x,y))
  end

  def length
    @vector.magnitude
  end

  def draw(window)
    color = Gosu::Color::GRAY
    window.draw_line(@start.x, @start.y, color, @end.x, @end.y, color)
  end

  def to_s
    "x1 #{@start.x} y1 #{@start.y} x2 #{@end.x} y2 #{@end.y} l #{length}" +
      " v #{@vector}"
  end
end
