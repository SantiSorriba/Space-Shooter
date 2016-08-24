require_relative '../utils'

class MenuOption

  def initialize(text, y)
    @image = Gosu::Image.from_text(text, 60, font: Utils.default_font)
    @x = Utils.center_x(@image)
    @y = y
  end

  def draw(coord_x, coord_y, coord_z, scale_x, scale_y, color)
    @image.draw(@x, @y, 1, 1, 1, Utils::TEXT_COLOR_LIGHT)
  end

end
