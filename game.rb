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

  def all_positions_occupied?
    @board.all? { |value| value != "\u26aa" }
  end

  def get_pc_moves()
    input = rand(1..7) 
    input
  end

  def valid_column?(column)
    until column.between?(1,7)
      print "Invalid column, enter any number from 1 to 7" 
      column = gets.chomp.to_i
    end
    column
  end

  # checks given column if it is full: if full position is nil, else returns position is index of first available array element
  def get_position(column)
    position = ""
    # binding.pry
    if column == 0
      position = find_available_position([35, 28, 21, 14, 7, 0])
    elsif column == 1
      position = find_available_position([36, 29, 22, 15, 8, 1])
    elsif column == 2
      position = find_available_position([37, 30, 23, 16, 9, 2])
    elsif column == 3
      position = find_available_position([38, 31, 24, 17, 10, 3])
    elsif column == 4
      position = find_available_position([39, 32, 25, 18, 11, 4])
    elsif column == 5
      position = find_available_position([40, 33, 26, 19, 12, 5])
    elsif column == 6
      position = find_available_position([41, 34, 27, 20, 13, 6])
    else
      # return 
    end
    position
  end
  
  # given array of indices sorted in descending order, it will get the first available position it finds
  def find_available_position(array)
    position = nil
    position = if column_full?(array)
      nil
    else
      array.find do |value|
        !position_occupied?(value)
      end
    end
    position
  end

  # given an array of indices for a column, it will check if all positions are occupied
  def column_full?(array)
    arr = []
    array.each do |position|
      arr << position_occupied?(position)      
    end

    result = if arr.all? {|e| e == true }
      true
    else
      false
    end
    result
  end

  # checks if position is within allowable range and if occupied
  def valid_move?(position)
    position.between?(0,41) && !position_occupied?(position)
  end

  def turn()
    #  uncomment when isolated debug or when play is not used
    # @turn_count = 1
    @current_player = @turn_count.odd? ? @player1 : @player2
    puts "#{@current_player.name} choose a column from 1 to 7"
    if @current_player.name === "Paimon"
      column = get_pc_moves()
      column = valid_column?(column)
    else
      column = gets.chomp.to_i
      column = valid_column?(column)
    end

    puts "#{@current_player.name} chose #{column}"
    column -= 1
    position = get_position(column).to_i
    
    if valid_move?(position)
      @board[position] = @current_player.color
      puts "#{@current_player.name} occupied square #{position}"
      puts "----------END OF #{@current_player.name.upcase}'S TURN----------"
    else
      puts "Invalid Input: Column is not between 1 to 7 or position is already occupied."
      turn()
    end
  end

  def play()
    puts "Initialize Board"
    display_board()
    @turn_count = 0
    until game_over?
      @turn_count += 1
      turn()
      puts "----------CURRENT BOARD STATUS----------"
      puts "Turn Number: #{@turn_count}"
      puts "Valid moves are white cells occupied from bottom up"
      display_board()
    end

    if win? 
      puts "GAME OVER. #{@current_player.name} wins!"
    else
      puts "Its a tie!"
    end
    puts "Do you want a rematch? Y/N"
    answer = gets.chomp.to_s.downcase
    if answer == "y"
      reset()
      play()
    else
      puts "Until the next match!"
    end
  end
end

class CONNECT_FOUR < Game
  HORIZONTALS = [
    [35, 36, 37, 38],
    [36, 37, 38, 39],
    [37, 38, 39, 40],
    [38, 39, 40, 41],
    [28, 29, 30, 31],
    [29, 30, 31, 32],
    [30, 31, 32, 33],
    [31, 32, 33, 34],
    [21, 22, 23, 24],
    [22, 23, 24, 25],
    [23, 24, 25, 26],
    [24, 25, 26, 27],
    [14, 15, 16, 17],
    [15, 16, 17, 18],
    [16, 17, 18, 19],
    [17, 18, 19, 20],
    [7, 8, 9, 10],
    [8, 9, 10, 11],
    [9, 10, 11, 12],
    [10, 11, 12, 13],
    [0, 1, 2, 3],
    [1, 2, 3, 4],
    [2, 3, 4, 5],
    [3, 4, 5, 6]
  ].freeze

  VERTICALS = [
    [35, 28 , 21, 14],
    [28, 21, 14, 7],
    [21, 14, 7, 0],
    [36, 29 , 22, 15],
    [29 , 22, 15, 8],
    [22, 15, 8, 1],
    [37, 30 , 23, 16],
    [30 , 23, 16, 9],
    [23, 16, 9, 2],
    [38, 31 , 24, 17],
    [31 , 24, 17, 10],
    [24, 17, 10, 3],
    [39, 32 , 25, 18],
    [32 , 25, 18, 11],
    [25, 18, 11, 4],
    [40, 33 , 26, 19],
    [33 , 26, 19, 12],
    [26, 19, 12, 5],
    [41, 34 , 27, 20],
    [34 , 27, 20, 13],
    [27, 20, 13, 6]
  ].freeze

  DIAGONALS = [
    [38, 30 , 22, 14],
    [38, 32 , 26, 20],
    [31, 23 , 15, 7],
    [31, 25 , 19, 13],
    [24, 16 , 8, 0],
    [24, 18 , 12, 6],
    [4, 10, 16, 22],
    [4, 12, 20, 28],
    [11, 17, 23, 29],
    [11, 19, 27, 35],
    [18, 24, 30, 36],
    [18, 26, 34, 42],
    [37, 31, 25, 19],
    [38, 32, 26, 20],
    [30, 33, 27, 21],
    [42, 34, 26, 18],
    [41, 33, 25, 17],
    [40, 32, 24, 16],
    [30, 24, 18, 12],
    [31, 25, 19, 13],
    [34, 26, 18, 10],
    [33, 25, 17, 9],
    [23, 17, 11, 5],
    [24, 18, 12, 6],
    [27, 19, 11, 3],
    [26, 18, 10, 2]
  ].freeze

  def tie?
    !win? && all_positions_occupied?
  end

  def horizontal_win?
    HORIZONTALS.detect do |p|
      @board[p[0]] == @board[p[1]] &&
        @board[p[1]] == @board[p[2]] &&
        @board[p[2]] == @board[p[3]] &&
        position_occupied?(p[0]) # p[0] coz last 3 statements returned true
    end
  end

  def vertical_win?
    VERTICALS.detect do |p|
      @board[p[0]] == @board[p[1]] &&
        @board[p[1]] == @board[p[2]] &&
        @board[p[2]] == @board[p[3]] &&
        position_occupied?(p[0]) # p[0] coz last 3 statements returned true
    end
  end

  def diagonal_win?
    DIAGONALS.detect do |p|
      @board[p[0]] == @board[p[1]] &&
        @board[p[1]] == @board[p[2]] &&
        @board[p[2]] == @board[p[3]] &&
        position_occupied?(p[0]) # p[0] coz last 3 statements returned true
    end
  end

  def win?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def game_over?
    win? || all_positions_occupied?
  end
end