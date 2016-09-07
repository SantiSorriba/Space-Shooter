require_relative 'player_ship'

class Level

  def initialize(window)
    @window = window
    @player = PlayerShip.new
  end

  def draw
    @player.draw
  end

  def update
    if @window.button_down?(Gosu::KbUp)
      @player.move_up!
    elsif @window.button_down?(Gosu::KbDown)
      @player.move_down!
    end
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    end
  end
end
