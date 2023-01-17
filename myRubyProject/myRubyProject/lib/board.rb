require_relative "board_space"

class Board
  attr_reader :game_board
  attr_accessor :last_player
  attr_reader :num_of_cols

  def initialize (num_of_rows=6, num_of_cols=7)
    @game_board = []
    @last_player = ''
    @num_of_cols = num_of_cols
    num_of_rows.times do
      row = []
      num_of_cols.times do
        row << BoardSpace.new
      end
      @game_board << row
    end
  end

  def rows
    @game_board

  end


  def print_board
    @game_board.each do |row|
    print "--"*@num_of_cols, "-\n"
    row.each do |cell|
        print "|"+cell.get_symbol
    end
    print "|\n"
  end
  print "--"*@num_of_cols, "-\n"
  end

end


