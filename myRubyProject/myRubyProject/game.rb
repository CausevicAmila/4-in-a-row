require_relative "lib/board"
require_relative "lib/board_space"
require_relative "lib/move"
require_relative "lib/player"
require "json"

def load_board_size()
    while 1 do
        puts "Choose number of rows of the board: "
        number_of_rows = gets.to_i
        
        puts "Choose number of columns of the board: "
        number_of_columns = gets.to_i
        
        if number_of_rows < 6 or number_of_columns < 7
            puts "Minimum dimension is 6x7"
            next
        end
        
        if (number_of_rows - number_of_columns).abs > 2
            puts "Difference between columns and rows cannot be greater than 2"
            next
        end
        break
    end
    return number_of_rows, number_of_columns
end
#write to file 
#def write(player_1, player_2)

  #File.open("game.txt", "w+") do |file|
    #file << player_1.history_of_moves << "\n"
    #file << player_2.history_of_moves
  #end
#end

def write(player_1, player_2,the_board)
  #ensure that the symbol method is only called on non-nil player objects 
  board_state = the_board.game_board.map { |row| row.map { |space| space.player.nil? ? " " : space.player.symbol } }
  data = {
      player1_history: player_1.history_of_moves,
      player2_history: player_2.history_of_moves,
      last_player: the_board.last_player,
      board_state: board_state
  }
  File.open("game.txt", "w+") do |file|
    file.write(JSON.generate(data))
  end
end 

#load
def loadGame()
  begin
    filename = "game.txt"
    file = File.open(filename)
    file_data = file.read
    data = JSON.parse(file_data)
    player1_history = data["player1_history"]
    player2_history = data["player2_history"]
    last_player = data["last_player"]
    board_state = data["board_state"]
    player_1 = Player.new("✖",player1_history)
    player_2 = Player.new("•",player2_history)
    the_board = Board.new(board_state)
    the_board.last_player = last_player
    player1_history.each do |column|
      move = Move.new(the_board, player_1, column)
      move.make_move
    end
    player2_history.each do |column|
      move = Move.new(the_board, player_2, column)
      move.make_move
    end
    puts "Let's resume the game!\n\n"
    puts the_board.print_board
    return player_1, player_2, the_board
  rescue
    puts "file not found"
    return nil
  end
end



# the_board.print_board()

play_again = 'y'
while play_again == 'y'
  puts "New Game (N) or Load Game (L)"
  choice = gets.chomp.downcase
  if choice == 'l'
    file_data = loadGame()
  else 
    player_1 = Player.new("✖")
    player_2 = Player.new("•")
    number_of_rows, number_of_columns = load_board_size
    the_board = Board.new(number_of_rows, number_of_columns)
    puts "Let's get started!\n\n"
    puts the_board.print_board
  end
  # CONTINUE UNTIL SOMEONE WINS
  game_over = false
  while !game_over
    valid_move = false
    next_player = (the_board.last_player == player_1) ? player_2 : player_1
    while valid_move == false
      puts "\n\nIt's your turn, (#{next_player.symbol}). Choose a column."
      the_move = the_move = Move.new(the_board, next_player, gets.to_i)
      valid_move = the_move.legal?
      puts "Sorry, #{the_move.column} isn't a valid move." if valid_move == false
    end
    the_move.make_move

    puts "\n"
    the_board.print_board()
    puts "History of moves, player (#{player_1.symbol}): " + player_1.history_of_moves.join(', ')
    puts "History of moves, player (#{player_2.symbol}): " + player_2.history_of_moves.join(', ')
    game_over = true if the_move.winner? || the_move.draw?
    puts "Do you want to save this game. (y/n)"
    answer = gets.chomp 
    if answer == 'y'
      write(player_1, player_2, the_board)
    end
  end

  # DECLARE WINNER
  if the_move.winner?
    puts "\nthe winner is #{the_move.player.symbol}!"
  else
    puts "the game is a draw!"
  end

  # PLAY AGAIN CHECK
  puts "Play again? (Y/N)"
  play_again = gets.chomp.downcase
  while play_again != 'n' && play_again != 'y'
    puts "\n\nPlay again? (Y/N)"
    play_again = gets.chomp.downcase
  end
end

# # DISPLAY THE RESULTS
# puts "\n\n#{player_1.name} won #{player_1.wins} times"
# puts "#{player_2.name} won #{player_2.wins} times"

# FINISH THE GAME
puts "\n\nThanks for playing!"
