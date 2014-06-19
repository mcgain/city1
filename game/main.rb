class Game < Hasu::Window
  WIDTH = 640
  HEIGHT = 480
  def initialize
    super(WIDTH, HEIGHT, false)
    @caption = "City1"
  end

  def reset
    @roads = RoadsGenerator.generate(self)
    @buildings = BuildingsGenerator.generate(self)
  end

  def update
  end

  def draw
    draw_background
    draw_roads
    draw_buildings
  end

  def draw_roads
    @roads.each {|r| r.draw(self)}
  end

  def draw_buildings
    @buildings.each {|b| b.draw(self)}
  end

  def draw_background
    color = Gosu::Color::GREEN
    draw_quad(0, 0, color,
              WIDTH, 0, color,
              0, HEIGHT, color,
              WIDTH, HEIGHT, color,
             )
  end

  def center
    Point.new(WIDTH / 2, HEIGHT / 2)
  end

  def random_location
    Point.new(Random.rand(WIDTH), Random.rand(HEIGHT))
  end
end
