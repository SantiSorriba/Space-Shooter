require 'gosu'

class EnemyShip

  def initialize(image_path, points, velocity)
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::SCREEN_WIDTH - @image.width
    @y = Random.rand(Game::SCREEN_HEIGHT - @image.height)
    @width = @image.width
    @height = @image.height
    @destroyed = false
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move!
    @x -= @velocity
  end

  def is_out?
    @x <= 0
  end

  def was_hit?(lasers)
    lasers.any? { |laser| hit?(laser) }
  end

  def destroy!
    @destroyed = true
  end

  def destroyed?
    @destroyed
  end

  def points
    10
  end

  private

  def hit?(laser)
    #Coordenadas de la nave
    enemy_ship_left = @x
    enemy_ship_right = @x + @width
    enemy_ship_top = @y
    enemy_ship_bottom = @y + @height
    #Coordenadas del caramelo
    laser_left = laser.x
    laser_right = laser.x + laser.width
    laser_top = laser.y
    laser_bottom = laser.y + laser.height
    #Comprobar Colisión
    if (enemy_ship_top > laser_bottom) || (enemy_ship_bottom < laser_top) || (enemy_ship_left > laser_right) || (enemy_ship_right < laser_left)
      false
    else
      true
    end
  end
end
