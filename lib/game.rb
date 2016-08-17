require 'gosu'

class Game < Gosu::Window
 SCREEN_WIDTH = 1024
 SCREEN_HEIGHT = 600

 def initialize
  super(SCREEN_WIDTH, SCREEN_HEIGHT)
  self.caption = 'SpaceShooter'
 end

end
