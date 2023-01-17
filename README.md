
![Logo](https://scholarship.ibu.edu.ba/assets/img/logo-burch-small.png)

# Connect 4 in Ruby 
Connect Four/Four in a row is the game 
made during our project in CEN 332 Programming Languages course.
Every student group received a programming language, in which we had to code our Connect 4 game. 
Our team called CC3 got a nowadays famous programming language called Ruby.

## About Ruby 
Ruby is a programming language that is designed to be simple and easy to read and write. 
It is often used for web development, scripting, and building command line tools. 
One of the most popular web frameworks for Ruby is Ruby on Rails, which is known for its convention over configuration principle and for making it easy to build web applications quickly. 
Additionally, the language has a supportive and active community, which has led to the creation of many useful libraries and gems that can be easily integrated into projects. 
Ruby is an object-oriented language, so it's based on the concept of classes and objects.
## About the game
Connect 4 is a two-player 
game in which players take
 turns dropping colored tokens 
 from the top into a vertically-suspended grid. 
 The discs fall to the bottom of the grid, 
 filling the lowest unoccupied space in the column. 
 The goal of the game is to place four of one's own colored discs in a row, either horizontally, vertically, or diagonally. 
 The player who succeeds in placing four of their discs in a row wins the game.
 ## A word or two, or 634 about our implementation 
 Our implementation consists of 4 help classes(*board_space, board, player, move*) and the main class called *game* class.
 Our board class consists of three methods: *occupied*, *set_player*, *get_symbol*. 
### main class
The class requires several classes: Board, BoardSpace, Move, and Player and it is the simulation
of the Connect 4 game. 
 ### board_space class
 Board_space class has three methods and it reads the value of the player (attr_reader).

 *Occupied* method tells us whether the space is occupied by the player or not. It does that by checking is the variable 
 player 'nil' or not and returns true if it is not and false if it is. 

*Set_player* method puts player on the space if it is not occupied 
by the other player. It assigns that player to the variable *player*. 
It is also calling the occupied method to check the space. 

*Get_symbol* method returns the symbol of the player that is occupying the space.
If the space isn't occupied, it returns whitespace. 

### board class
Board class is used to create a new game board, ass playes on the board, get the current state of the board and print it. 
In the beginning of the class, we can see 'require_relative' which means that it is connected with the 
board_space class. 
This class has attr_reader for game_board and num_of_cols and attr_accessor for the last_player. 
*attr_reader* reads the value of game_board and num_of_cols. These values cannot be changed.
*attr_accessor* allows to read and write values of last player.

This class has an *initialize* constructor method that creates board with specified number of rows and columnts. 
It also creates an empty string for the last player and sets the number of columns. Rows return the game board. 
Print board function prints the currents state of the game board in the form of grid. 
### player class 
The player class provides information about players and their moves. This class  reads the values of symbol and history of moves for each player. 

*initialize* method is a constructor method that creates a new player with 
and empty array called *history_of_moves* that stores the movies of the player and 
It also stores the specified symbol for that player. 
### move class 
*move* class is used to make a move on a game board, check if the move is legal, check if the player has won or if the game is a draw. It uses the Board, Player and BoardSpace classes. 
This class has several functions and reads player information, columns and rows, as board information. 

*initialize* method is used to initialize a new move for the player on the board. 

*make_move* method is checking if the move is illegal or not, meaning if it is possible to 
move to the row or columng specified. If the move is allowed, it assigns player to that
position, adds that move to *the history_of_moves* and goes to the next player. 

*legal* method checks if the move is legal by checking if the move is greater than the number of columns, less than 1 or if the top of the column is occupied.

*open_row* is the method which finds the first open row by iterating through the rows in reverse order, returns the index of the open row if it finds one, otherwise returns false.

*winner* method checks if the player has won by calling vertical_win?, horizontal_win? or diagonal_win?

*vertical_win* function checks if the player has won vertically by counting the number of times the player's symbol appears in the same column and returns true if there are 4 or more, 
similar as the *horizontal_win*, just in the opposite way. 

*diagonal_win* is used to see if the player has won diagonally by creating 4 arrays that represent 4 diagonal lines and checking each line if there are 4 or more of player's symbols.

*draw*  checks if the game is a draw by checking if the top row of the board is full.



 


## CC3 members

- [Ajdin Bajrić](https://github.com/AjdinBajric) 
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ajdin-bajric/)
- [Amila Čaušević](https://github.com/CausevicAmila)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/amila-causevic-679691223/)
- [Lejla Breščić](https://github.com/lejlabrescic)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/lejlabrescic/)



## Running the project

- To run our project, firstly you need to download Ruby [from the following link](https://www.ruby-lang.org/en/documentation/installation/).
- To finally run the game, if our Ruby interpreter is installed correctly, in terminal we type: 

ruby game.rb



