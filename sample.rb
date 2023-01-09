require_relative "player.rb"

puts "\u{1f534}"  #red
puts "\u{1f535}"
arr = Array.new(9, "\u{1f534}")
print arr
puts arr

rows, cols = 6,7  # your values
grid = Array.new(rows, "\u26aa") { Array.new(cols, "\u26aa") }
width = grid.flatten.max.to_s.size+2

puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }
puts ""
grid[5][6] = "\u{1f535}"
puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }
grid[5][3] = "\u{1f534}"
puts ""
puts grid.map { |a| a.map { |i| i.to_s.rjust(width)}.join }

@board = Array.new(9, "\u26aa")
puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  "

puts "  #{@board[3]}  #{@board[4]}  #{@board[5]}  "

puts "  #{@board[6]}  #{@board[7]}  #{@board[8]}  "

@board[0] = "\u{1f534}"
puts ""
puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  "

puts "  #{@board[3]}  #{@board[4]}  #{@board[5]}  "

puts "  #{@board[6]}  #{@board[7]}  #{@board[8]}  "

# @player1 = Player.new("Ayato", "blue")
# @player1.display()