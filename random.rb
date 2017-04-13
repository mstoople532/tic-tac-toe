board = {
  a: ["A1", "A2", "A3"],
  b: ["B1", "B2", "B3"],
  c: ["C1", "C2", "C3"]
}
def print_board(board)
  print board[:a]
  puts
  print board[:b]
  puts
  print board[:c]
  puts
end

print_board(board)

count = 0

puts "X, please pick a move"
input = gets.chomp
player_type = "X"

def find_position(player_type, input, board)
  input = input.chars
  row = input.first.to_sym
  column = input.last.to_i - 1
  cell = board[row][column]
  cell = player_type

end
print find_position(player_type, input, board)
