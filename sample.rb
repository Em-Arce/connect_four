require_relative "player.rb"
require_relative "game.rb"

# puts "\u{1f534}"  #red
# puts "\u{1f535}"
# arr = Array.new(9, "\u{1f534}")
# print arr
# puts arr

# rows, cols = 6,7  # your values
# grid = Array.new(rows, "\u26aa") { Array.new(cols, "\u26aa") }
# width = grid.flatten.max.to_s.size+2

# puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }
# puts ""
# grid[5][6] = "\u{1f535}"
# puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }
# grid[5][3] = "\u{1f534}"
# puts ""
# puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }

# @board = Array.new(9, "\u26aa")
# puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  "

# puts "  #{@board[3]}  #{@board[4]}  #{@board[5]}  "

# puts "  #{@board[6]}  #{@board[7]}  #{@board[8]}  "

# @board[0] = "\u{1f534}"
# puts ""
# puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  "

# puts "  #{@board[3]}  #{@board[4]}  #{@board[5]}  "

# puts "  #{@board[6]}  #{@board[7]}  #{@board[8]}  "

# @player1 = Player.new("Ayato", "blue")
# @player1.display()
@board = Array.new(42, "\u26aa")
puts ""
puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  #{@board[3]}  #{@board[4]}  #{@board[5]}  #{@board[6]}  "

puts "  #{@board[7]}  #{@board[8]}  #{@board[9]}  #{@board[10]}  #{@board[11]}  #{@board[12]}  #{@board[13]}  "

puts "  #{@board[14]}  #{@board[15]}  #{@board[16]}  #{@board[17]}  #{@board[18]}  #{@board[19]}  #{@board[20]}  "

puts "  #{@board[21]}  #{@board[22]}  #{@board[23]}  #{@board[24]}  #{@board[25]}  #{@board[26]}  #{@board[27]}  "

puts "  #{@board[28]}  #{@board[29]}  #{@board[30]}  #{@board[31]}  #{@board[32]}  #{@board[33]}  #{@board[34]}  "

puts "  #{@board[35]}  #{@board[36]}  #{@board[37]}  #{@board[38]}  #{@board[39]}  #{@board[40]}  #{@board[41]}  "

@player1 = Player.new("Ayaka", "\u{1f534}")
@player1.display()
@player2 = Player.new("Paimon", "\u{1f535}")
@player2.display()
puts "#{@player1.name} will be playing against #{@player2.name}"
game = Game.new(@player1, @player2)
puts "Initializing board..."
game.display_board()
game.turn()