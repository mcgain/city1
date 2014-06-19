class RoadsGenerator
  def self.generate(window)
    main_road = generate_main_road(window)
    roads = [main_road]
    Random.rand(50).times do
      roads << road_based_on(main_road)
    end
    roads
  end

  def self.road_based_on(base_road)
    start = random_point_on_road(base_road)
    end_road = Point.new(start.x + Random.rand(200), start.y + Random.rand(200))
    Road.new(start, end_road)
  end

  def self.random_point_on_road(road)
    factor = Random.rand()
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
  attr_reader :start, :end
  def initialize(road_start, road_end)
    @start = road_start
    @end = road_end
  end

  def draw(window)
    color = Gosu::Color::GRAY
    window.draw_line(@start.x, @start.y, color, @end.x, @end.y, color)
  end
end
