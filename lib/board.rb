require_relative 'master'
require_relative 'guesser'
# Board for playing the game
class Board
  def initialize
    @row = []
    @board = Array.new(12)
    @code_master = Master.new
    @code_breaker = Guesser.new
  end

  def display_pegs(pegs)
    "|#{pegs.join('|')}|"
  end
end
