require_relative 'player_ship'
require_relative 'score'
require_relative 'life_counter'
require_relative 'enemy_ship'

class Level

  def initialize(window, enemy_ship_definitions)
    @enemy_ships = []
    @score = Score.new
    @window = window
    @player = PlayerShip.new
    @lasers = []
    @life_counter = LifeCounter.new
    @enemy_ship_definitions = enemy_ship_definitions
  end

  def draw
    @player.draw
    @lasers.each { |laser| laser.draw }
    @score.draw
    @life_counter.draw
    @enemy_ships.each { |enemy_ships| enemy_ships.draw }
  end

  def update
    if @window.button_down?(Gosu::KbUp)
      @player.move_up!
    elsif @window.button_down?(Gosu::KbDown)
      @player.move_down!
    end
    @lasers.each { |laser| laser.move! }
    @lasers.reject! { |laser| laser.is_out? }
    create_enemy_ship
    @enemy_ships.each { |enemy_ships|
    enemy_ships.move!
    if enemy_ships.was_hit?(@lasers)
      enemy_ships.destroy!
      @score.update_points!(enemy_ships.points)
    elsif enemy_ships.is_out?
      @life_counter.lose_life!
      @window.show_game_over(@score.points) if @life_counter.game_over?
    end}
    @enemy_ships.reject!{ |ship| ship.is_out? || ship.destroyed? }
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    when Gosu::KbSpace
      @lasers << laser = @player.shoot
    end
  end

  def create_enemy_ship
    current_time = Gosu::milliseconds
    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time
      info = @enemy_ship_definitions.sample
      @enemy_ships << EnemyShip.new(info[:image_path], info[:points], info[:velocity])
    end
  end

  def time_between_enemy_ships
    case @score.points
    when 0..1000
      3000
    when 1000..2000
      2000
    else
      1000
    end
  end

end
