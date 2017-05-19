require_relative "board"
require_relative "player"

class Game
  def start!
    player_selector
    gameplay
  end

  def player_selector
    puts "Player Two, X or O?"
    while player_symbol = gets.chomp.upcase
      if player_symbol == "X"
        @player_two = Player.new(player_symbol, "Player two")
        @player_one = Player.new("O", "Player one")
        break
      elsif player_symbol == "O"
        @player_two = Player.new(player_symbol, "Player two")
        @player_one = Player.new("X", "Player one")
        break
      else
        puts "Player Two, X or O?"
      end
    end
  end

  def gameplay
    board = Board.new
    move_count = 0

    until board.available_moves.empty?
      board.display

      current_player = if move_count.even?
                         player_one
                       else
                         player_two
                       end

      puts "#{current_player.player_type}, please choose a move"
      player_move = gets.chomp.downcase
      if board.move_unavailable?(player_move)
        puts "Move unavailable, try again!"
        redo
      end
      current_player.player_move(board, player_move)
      if current_player.player_win?
        puts "#{current_player.player_type} wins!"
        break
      elsif board.available_moves.empty?
        puts "Tie game!"
        board.display
        break
      end
      move_count += 1
    end
  end
end
