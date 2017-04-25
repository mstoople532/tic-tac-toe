require_relative "board"
require_relative "player"

puts "Player Two, X or O?"
player_symbol = gets.chomp.upcase

if player_symbol == "X"
  player_two = Player.new(player_symbol, "player_two")
  player_one = Player.new("O")
elsif player_symbol == "O"
  player_two = Player.new(player_symbol)
  player_one = Player.new("X")
else
  "Please provide valid input"
end

board = Board.new
move_count = 0

board.display

puts "Player one, please choose a move"
player_one_move = gets.chomp.downcase
board.make_a_move!(player_one_move, player_one.player_symbol)
player_one.set_move(player_one_move)
player_one.player_win?
move_count += 1
board.display

puts "Player two, please choose a move"
player_two_move = gets.chomp.downcase
board.make_a_move!(player_two_move, player_two.player_symbol)
player_two.set_move(player_two_move)
move_count += 1
board.display
