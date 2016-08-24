require 'gosu'
require_relative 'menu/main_menu'
require_relative 'utils'

class Game < Gosu::Window
 SCREEN_WIDTH = 1024
 SCREEN_HEIGHT = 600

 def initialize
  super(SCREEN_WIDTH, SCREEN_HEIGHT)
  self.caption = 'SpaceShooter'
  @current_screen = MainMenu.new(self)
 end

 def draw
   @current_screen.draw
 end

 def button_down(id)
   @current_screen.button_down(id)
 end

end
