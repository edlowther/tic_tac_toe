require_relative 'player'
require_relative 'grid'
require_relative 'command_line_printer'

class Game
  attr_reader :players, :grid
  def initialize(player_class=Player, grid_class=Grid, printer_class=CommandLinePrinter)
    @players = []
    2.times { @players << player_class.new }
    @player_in_play = @players.first
    @grid = grid_class.new
    @game_is_over = false
    @printer_class = printer_class
  end

  def select_square(id)
    square = @grid.get_square_by_id(id)
    if !@game_is_over && !square.is_occupied?
      @player_in_play.add_square(square)
      end_or_continue_game
    end
  end

  def is_over?
    @game_is_over
  end

  private
  def toggle_player_in_play
    if @player_in_play == @players.first
      @player_in_play = @players.last
    else
      @player_in_play = @players.first
    end
  end

  def end_or_continue_game
    @player_in_play.check_if_won(@grid.winning_combinations)
    if @player_in_play.has_won?
      @game_is_over = true
      puts @printer_class.new(@grid, winner=@player_in_play.id).output
    elsif @grid.is_full?
      puts @printer_class.new(@grid, winner="NOBODY").output
      @game_is_over = true
    else
      puts @printer_class.new(@grid).output
    end
    toggle_player_in_play
  end
end
