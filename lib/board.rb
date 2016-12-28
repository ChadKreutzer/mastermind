Dir['./lib/*'].each { |file_name| require file_name }

# Board for playing the game
class Board
  # attr_accessor :board

  def initialize
    @board = Array.new(12) { Array.new(1, '|  |  |  |  |') }
  end

  def display_board
    current_board = ''
    11.downto(0) do |row|
      current_board += "#{@board[row][0]}|#{@board[row][1]}\n"
    end
    current_board
  end

  def display_pegs(pegs)
    "|#{pegs.join('|')}|"
  end

  def new_guess(turn, breaker_guess)
    @board[turn][0] = display_pegs(breaker_guess)
  end

  def new_hint(turn, master_hint)
    @board[turn][1] = display_pegs(master_hint)
  end
end
