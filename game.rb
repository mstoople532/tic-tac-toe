require_relative "board"
require_relative "player"

puts "Player Two, X or O?"
player_type = gets.chomp.upcase

if player_type == "X"
  player_two = Player.new(player_type)
  player_one = Player.new("O")
elsif player_type == "O"
  player_two = Player.new(player_type)
  player_one = Player.new("X")
else
  "Please provide valid input"
end

board = Board.new
move_count = 0

board.display

puts "Please choose a move"
player_one_move = gets.chomp.downcase
board.find_position!(player_one_move, player_one.player_type)
board.display
