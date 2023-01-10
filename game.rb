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
    puts "  1   2   3   4   5   6   7"
    puts ""
    puts "  #{@board[0]}  #{@board[1]}  #{@board[2]}  #{@board[3]}  #{@board[4]}  #{@board[5]}  #{@board[6]}  "
    puts "  #{@board[7]}  #{@board[8]}  #{@board[9]}  #{@board[10]}  #{@board[11]}  #{@board[12]}  #{@board[13]}  "
    puts "  #{@board[14]}  #{@board[15]}  #{@board[16]}  #{@board[17]}  #{@board[18]}  #{@board[19]}  #{@board[20]}  "
    puts "  #{@board[21]}  #{@board[22]}  #{@board[23]}  #{@board[24]}  #{@board[25]}  #{@board[26]}  #{@board[27]}  "
    puts "  #{@board[28]}  #{@board[29]}  #{@board[30]}  #{@board[31]}  #{@board[32]}  #{@board[33]}  #{@board[34]}  "
    puts "  #{@board[35]}  #{@board[36]}  #{@board[37]}  #{@board[38]}  #{@board[39]}  #{@board[40]}  #{@board[41]}  "
    puts ""
  end

  def position_occupied?(position)
    @board[position] != "\u26aa"
  end

  def valid_move?(position)
    position.between?(0,41) && !position_occupied?(position)
  end

  

  def get_pc_moves()
    input = rand(1..7) 
    input
  end

  def valid_column?(column)
    column.between?(1,7)
  end

  def get_position(column)
    position = ""
    # binding.pry
    if column == 0
      arr = [35, 28, 21, 14, 7, 0]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end  
    elsif column == 1
      arr = [36, 29, 22, 15, 8, 1]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end
    elsif column == 2
      arr = [37, 30, 23, 16, 9, 2]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end  
    elsif column == 3
      arr = [38, 31, 24, 17, 10, 3]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end
    elsif column == 4
      arr = [39, 32, 25, 18, 11, 4]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end
    elsif column == 5
      arr = [40, 33, 26, 19, 12, 5]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end
    elsif column == 6
      arr = [41, 34, 27, 20, 13, 6]
      arr.each do |el|
        if position_occupied?(el) == false
          position = el.to_i
          break
        end
      end
    else
      # return 
    end
    position
  end

  def turn()
    #  uncomment when isolated debug or when play is not used
    # @turn_count = 1
    @current_player = @turn_count.odd? ? @player1 : @player2
    puts "#{@current_player.name} choose a column from 1 to 7"
    if @current_player.name === "Paimon"
      column = get_pc_moves()
    else
      column = gets.chomp.to_i
      until valid_column?(column)
        print "Invalid column, enter any number from 1 to 7" 
        column = gets.chomp.to_i
      end
    end
    column -= 1
    position = get_position(column)
    if valid_move?(position)
      @board[position] = @current_player.color
      puts "#{@current_player.name} took cell #{position + 1}"
    else
      puts "invalid input, choose another column 1 to 7"
      turn
    end
    # display_board
  end

  def play
    puts "Initialize Board"
    display_board
    @turn_count = 0
    until @turn_count == 4
      @turn_count += 1
      turn()
      puts "----------CURRENT BOARD STATUS----------"
      puts "Turn Number: #{@turn_count}"
      puts "Valid moves are white cells occupied from bottom up"
      display_board
    end
    puts "GAME OVER"
  end
end