require 'gosu'
require_relative 'menu/main_menu'
require_relative 'utils'

class Game < Gosu::Window
 SCREEN_WIDTH = 1024
 SCREEN_HEIGHT = 600

 def initialize
  super(SCREEN_WIDTH, SCREEN_HEIGHT)
  self.caption = 'SpaceShooter'
  @main_menu = MainMenu.new(self)
  @current_screen = @main_menu
 end

 def draw
   @current_screen.draw
 end

 def update
   @current_screen.update
 end

 def show_level
   @current_screen = Level.new(self)
 end

 def show_main_menu
   @current_screen = @main_menu
 end

 def button_down(id)
   @current_screen.button_down(id)
 end

end
