require_relative 'master'
require_relative 'guesser'

# Board for playing the game
class Board
  
  def initialize
    @board = Array.new(12) { Array.new(2) }
  end

  def display_board
    11.downto(0) do |row|
      puts "#{@board[row][0][1]}"

  end

  def display_pegs(pegs)
    "|#{pegs.join('|')}|"
  end  

  def new_guess(breaker_guess)
    @board[turn][0] = breaker_guess
  end

  def new_hint(master_hint)
    @board[turn][1] = master_hint
  end
end
