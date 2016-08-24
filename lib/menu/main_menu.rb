require 'gosu'
require_relative 'menu_option'

class MainMenu
  OPTIONS_MARGIN_TOP = 200
  MARGIN_INTERNAL_Y = 80

  def initialize(window)
    @title = Gosu::Image.from_text('Menu Principal', Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @window = window
    @options = []
    ["jugar", "salir"].each_with_index do |text, index|
      option_y = OPTIONS_MARGIN_TOP + (index * MARGIN_INTERNAL_Y)
      @options << MenuOption.new(text, option_y)
    end
  end

  def draw
    @title.draw(@x, 0, 0)
    @options.each do |option|
      option.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      @window.close
    end
  end

end
