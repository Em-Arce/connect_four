require_relative 'player.rb'
require_relative "game.rb"
require "pry-byebug"

def valid_input?(input)
  input == "b" || input == "r"
end

def assign_players()
  puts "Annyeong"
end

print "MODES"
puts "1  2 computers"
puts "2  player1 is human, player 2 is computer"
puts "3  2 human players"
puts "Enter mode: "
@mode = gets.chomp.to_i

print "Enter player1 Name : "
@name1 = gets.chomp
print "Enter Color  "
puts "Enter b for blue or r for red: "
@input1 = gets.chomp

until valid_input?(@input1)
  print "Invalid color, Enter b for blue or r for red: " 
  @input1 = gets.chomp
end

def convert_input_to_ascii(input)
  color = if input == "r"
    "\u{1f534}" 
  elsif input == "b"
    "\u{1f535}"
  end
  color
end

@color1 = convert_input_to_ascii(@input1)

player1 = Player.new(@name1, @color1)
player1.display()

def computer_color(color1)
  color2 = if color1 == "b"
    "\u{1f534}"
  elsif color1 == "r"
    "\u{1f535}"
  end
  color2
end

# for player2 which is computer
@name2 = "Paimon"
@color2 = computer_color(@input1)
player2 = Player.new(@name2, @color2)
player2.display()
puts "It's #{@name1} vs #{@name2} match!"

# game = CONNECT_FOUR.new(player1, player2)
# game.play()


