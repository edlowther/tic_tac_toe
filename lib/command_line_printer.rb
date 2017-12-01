class CommandLinePrinter
  def initialize(grid)
    @grid = grid
  end

  def output
    result = "Player one: O
Player two: X
-------------
|"
    (0..2).each { |i| result += " #{substitute_symbol_if_occupied(i)} |"}
    result += "\n-------------\n|"
    (3..5).each { |i| result += " #{substitute_symbol_if_occupied(i)} |"}
    result += "\n-------------\n|"
    (6..8).each { |i| result += " #{substitute_symbol_if_occupied(i)} |"}
    result += "\n-------------"
    result
  end

  private
  def substitute_symbol_if_occupied(square_index)
    square = @grid.squares[square_index]
    if square.occupied_by != 'n/a'
      return square.occupied_by
    else
      return " "
    end
  end
end
