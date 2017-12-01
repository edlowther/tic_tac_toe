require 'player'
require 'grid'

class Game
  attr_reader :players, :grid
  def initialize(player_class=Player, grid_class=Grid)
    @players = []
    2.times { @players << player_class.new }
    @player_in_play = @players.first
    @grid = grid_class.new
  end

  def select_square(id)
    square = @grid.get_square_by_id(id)
    if !square.is_occupied?
      @player_in_play.add_square(square)
      @player_in_play.check_if_won(@grid.winning_combinations)
      toggle_player_in_play
    end
  end

  private
  def toggle_player_in_play
    if @player_in_play == @players.first
      @player_in_play = @players.last
    else
      @player_in_play = @players.first
    end
  end
end
