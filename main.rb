require_relative 'player.rb'
require_relative "game.rb"
require "pry-byebug"

def valid_input?(input)
  input == "b" || input == "r"
end

def get_name()
  print "Enter player name : "
  @name = gets.chomp.to_s
  @name
end

def convert_input_to_ascii(input)
  color = if input == "r"
    "\u{1f534}" 
  elsif input == "b"
    "\u{1f535}"
  end
  color
end

def get_color()
  print "Enter Color  "
  puts "Enter b for blue or r for red: "
  @input = gets.chomp.to_s

  until valid_input?(@input)
    print "Invalid color, Enter b for blue or r for red: " 
    @input = gets.chompto_s
  end
  @input
end

def get_computer_color(color1)
  # binding.pry
  color2 = if color1 == "b"
    "\u{1f534}"
  elsif color1 == "r"
    "\u{1f535}"
  end
  color2
end

# can add mode 1: 2 computer players and mode 3: 2 human players
def get_player_info(mode)
  player1, player2 = nil
  if mode == 2 
    @name1 = get_name()
    @input1 = get_color().to_s
    @color1 = convert_input_to_ascii(@input1)
    player1 = Player.new(@name1, @color1)
    player1.display()

    # for player2 which is computer
    @name2 = "Paimon"
    @color2 = get_computer_color(@input1)
    # binding.pry
    player2 = Player.new(@name2, @color2)
    player2.display()
  else
    nil
  end
  return player1, player2  
end

def valid_mode?(mode)
  # until mode.between?(1,3)
  #   print "Invalid mode, enter any number from 1 to 3 " 
  #   mode = gets.chomp.to_i
  # end
  until mode == 2
    print "Invalid mode, enter mode 2" 
    mode = gets.chomp.to_i
  end
  mode
end

puts "CONNECT FOUR MODES"
puts "1: 2 computers"
puts "2: player1 is human, player 2 is computer"
puts "3: 2 human players"
puts "Enter mode 2 for now"
mode = gets.chomp.to_i
mode = valid_mode?(mode=2)

puts "----------PLAYERS----------"
player1, player2 = get_player_info(mode)
puts "#{player1.name} vs #{player2.name} match begins!"

game = CONNECT_FOUR.new(player1, player2)
game.play()


