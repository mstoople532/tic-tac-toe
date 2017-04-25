require "set"

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
    WINNING_MOVES.map { |set| set.subset?(@moveset) }.any?
  end
end
