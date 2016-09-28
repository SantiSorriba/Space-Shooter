require 'gosu'

class Laser
  attr_accessor :x, :width, :y, :height

  def initialize(x, y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @x = x
    @y = y - @image.height / 2
    @width = @image.width
    @height = @image.height
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move!
    @x += 10
  end

  def is_out?
    @x > Game::SCREEN_WIDTH
  end
end
