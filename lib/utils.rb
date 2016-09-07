module Utils
  FONT_SIZE_BIG = 90
  TEXT_COLOR_LIGHT = Gosu::Color.new(255 * 0.30, 0, 187, 51)
  TEXT_COLOR = Gosu::Color.new(255, 0, 187, 51)

  def self.default_font
    'media/fonts/kenvector_future_thin.ttf'
  end

  def self.center_x(object)
    (Game::SCREEN_WIDTH / 2) - (object.width / 2)
  end

  def self.center_y(ship)
    (Game::SCREEN_HEIGHT / 2) - (ship.height / 2)
  end
end
