require "pry"
require_relative "player"

class Board
  attr_accessor :layout, :available_moves
  def initialize
    @layout = {
      a: %w(A1 A2 A3),
      b: %w(B1 B2 B3),
      c: %w(C1 C2 C3)
    }
    @available_moves = %w(a1 a2 a3 b1 b2 b3 c1 c2 c3)
  end

  def display
    print @layout[:a]
    puts
    print @layout[:b]
    puts
    print @layout[:c]
    puts
  end

  def make_a_move!(input, player_symbol)
    input = input.chars
    row = input.first.to_sym
    column = input.last.to_i - 1
    @layout[row][column] = player_symbol
  end

  def move_unavailable?(input)
    !@available_moves.include?(input)
  end

  def remove_available_move!(input)
    @available_moves.delete(input)
  end
end
