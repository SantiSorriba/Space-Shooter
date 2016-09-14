require 'gosu'

class Score
attr_reader :points

  def initialize
    @points = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
  end

  def draw
    @text.draw(@points, Game::SCREEN_WIDTH - 120, 10, 1)
  end

end
