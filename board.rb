require "pry"
require_relative "player"

class Board
  attr_accessor :layout
  def initialize
    @layout = {
      a: ["A1", "A2", "A3"],
      b: ["B1", "B2", "B3"],
      c: ["C1", "C2", "C3"]
    }
  end

  def display
    print @layout[:a]
    puts
    print @layout[:b]
    puts
    print @layout[:c]
    puts
  end

  def find_position!(input, player_symbol)
    input = input.chars
    row = input.first.to_sym
    column = input.last.to_i - 1
    cell = @layout[row][column]
    layout[cell] = player_symbol
  end
end
