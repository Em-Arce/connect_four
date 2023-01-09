require_relative "player.rb"
require "pry-byebug"

class Game
  def initialize(player1, player2)
    @board = Array.new(42, "\u26aa")
    @player1 = player1
    @player2 = player2
  end

  def reset
    @board = Array.new(42, "\u26aa")
  end

  def display_board
    puts ""
    puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  #{@board[3]}  #{@board[4]}  #{@board[5]}  #{@board[6]}  "
    
    puts "  #{@board[7]}  #{@board[8]}  #{@board[9]}  #{@board[10]}  #{@board[11]}  #{@board[12]}  #{@board[13]}  "

    puts "  #{@board[14]}  #{@board[15]}  #{@board[16]}  #{@board[17]}  #{@board[18]}  #{@board[19]}  #{@board[20]}  "

    puts "  #{@board[21]}  #{@board[22]}  #{@board[23]}  #{@board[24]}  #{@board[25]}  #{@board[26]}  #{@board[27]}  "

    puts "  #{@board[28]}  #{@board[29]}  #{@board[30]}  #{@board[31]}  #{@board[32]}  #{@board[33]}  #{@board[34]}  "

    puts "  #{@board[35]}  #{@board[36]}  #{@board[37]}  #{@board[38]}  #{@board[39]}  #{@board[40]}  #{@board[41]}  "

  end

  def position_occupied?(position)
    @board[position] != "\u26aa"
  end

  def valid_move(position)
    position.between?(0,41) && !position_occupied?(position)
  end

  def allowed_positions()
    array = [35,36,37,38,39,40,41]
    array
  end


  def update_allowable_position(array, position)
    # binding.pry
    if array.include?(position) && (35..41).include?(position)
      array.delete(position)
      array.append(28, 29, 30, 31, 32, 33, 34)
    elsif array.include?(position) && (28..34).include?(position)
      array.delete(position)
      array.append(21, 22, 23, 24 , 25, 26, 27)
    elsif array.include?(position) && (21..27).include?(position)
      array.delete(position)
      array.append(14, 15, 16, 17 , 18, 19, 20)
    elsif array.include?(position) && (14..20).include?(position)
      array.delete(position)
      array.append(7, 8, 9, 10, 11, 12, 13)
    elsif array.include?(position) && (7..13).include?(position)
      array.delete(position)
      array.append(0, 1, 2, 3, 4, 5, 6)
    end
    array
  end

  def turn(turn_count)
    #  uncomment when isolated debug
    # @turn_count = 1
    @current_player = @turn_count.odd? ? @player1 : @player2
    # @allowed_positions = if turn_count == 1
    #                       allowed_positions()
    #                   else
    @allowed_positions = allowed_positions
    puts "#{@current_player} choose a number between 36 - 42"
    position = gets.chomp.to_i
    position -= 1
    @updated_allowable_positions = update_allowable_position(@allowed_positions, position).sort
    if valid_move?(position)
      @board[position] = @current_player.color
    else
      puts "invalid input between #{updated_allowable_positions}"
      turn
    end
  end
end