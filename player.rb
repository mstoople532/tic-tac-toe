require "set"
require_relative "board"

WINNING_MOVES = [
  Set["a1", "a2", "a3"],
  Set["b1", "b2", "b3"],
  Set["c1", "c2", "c3"],
  Set["a1", "b2", "c3"],
  Set["c1", "b2", "a3"]
]

class Player
  attr_accessor :player_symbol, :moveset, :player_type
  def initialize(player_symbol, player_type)
    @player_symbol = player_symbol
    @moveset = Set.new
    @player_type = player_type
  end

  def set_move(move)
    @moveset << move
  end

  def player_win?
    WINNING_MOVES.any? { |set| set.subset?(@moveset) }
  end

  def player_move(board)
    puts "#{self.player_type}, please choose a move"
    player_move = gets.chomp.downcase
    board.remove_available_move!(player_move)
    board.make_a_move!(player_move, self.player_symbol)
    self.set_move(player_move)
  end
end
