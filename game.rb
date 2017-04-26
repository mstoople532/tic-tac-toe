require_relative "board"
require_relative "player"

puts "Player Two, X or O?"
player_symbol = gets.chomp.upcase

if player_symbol == "X"
  player_two = Player.new(player_symbol, "Player two")
  player_one = Player.new("O", "Player one")
elsif player_symbol == "O"
  player_two = Player.new(player_symbol, "Player two")
  player_one = Player.new("X", "Player one")
else
  "Please provide valid input"
end

# players = [player_one, player_two]

board = Board.new
move_count = 0

until board.available_moves.empty?
  board.display

  current_player = if move_count.even?
                     player_one
                   else
                     player_two
                   end

  current_player.player_move(board)
  if current_player.player_win?
    puts "#{current_player.player_type} wins!"
    break
  elsif board.available_moves.empty?
    puts "Tie game!"
    break
  end
  move_count += 1
end

# elsif !@available_moves.include?(input)
#   puts "Please put valid move"
# else
