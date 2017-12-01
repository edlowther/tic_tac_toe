require 'command_line_printer'

describe CommandLinePrinter do
  let(:grid) { double(:grid) }
  subject(:printer) { described_class.new(grid)}
  it 'prints the player symbols and an empty grid at the start of the game' do
    allow(grid).to receive(:squares).and_return [
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
      ]
    expected_output = "Player one: O
Player two: X
-------------
|   |   |   |
-------------
|   |   |   |
-------------
|   |   |   |
-------------"
    expect(printer.output).to eq expected_output
  end
  it 'prints the player symbols and the game\'s progress' do
    allow(grid).to receive(:squares).and_return [
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'O'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'n/a'),
        double(:square, :occupied_by => 'X'),
        double(:square, :occupied_by => 'n/a'),
      ]
    expected_output = "Player one: O
Player two: X
-------------
|   |   | O |
-------------
|   |   |   |
-------------
|   | X |   |
-------------"
    expect(printer.output).to eq expected_output
  end
end
