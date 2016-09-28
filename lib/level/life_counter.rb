require 'gosu'

class LifeCounter
MARGIN_LEFT = 10
MARGIN_TOP = 10
MARGIN_INTERNAL_X = 4

  def initialize
    @lives = 5
    @image = Gosu::Image.new('media/images/power.png')
    @lost_life_sound = Gosu::Sample.new('media/sounds/lost_life.ogg')
  end

  def draw
    @lives.times do |index|
      x = MARGIN_LEFT + index * (@image.width + MARGIN_INTERNAL_X)
      @image.draw(x, MARGIN_TOP, 1)
    end
  end

  def lose_life!
    @lives -= 1
    @lost_life_sound.play
  end

  def game_over?
    @lives == 0
  end

end
