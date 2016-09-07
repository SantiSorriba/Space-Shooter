require 'gosu'

class PlayerShip

  def initialize
    @image = Gosu::Image.new('media/images/player/ship.png')
    @y = Utils.center_y(@image)
  end

  def draw
    @image.draw(0, @y, 1)
  end

  def move_up!
    if @y - 5 > 0
      @y -= 5
    end
  end

  def move_down!
    if @y + 5 + @image.height < Game::SCREEN_HEIGHT
      @y += 5
    end
  end
end
