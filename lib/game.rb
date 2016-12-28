Dir['./lib/*'].each { |file_name| require file_name }
# Class for playing game
class Game
  include Helper
  CORRECT_GUESS = [:BK, :BK, :BK, :BK].freeze

  def initialize
    @turn = 0
    @game_board = Board.new
    @code_master = Master.new
    @code_breaker = Guesser.new
  end

  def play
    loop do
      puts @game_board.display_board
      print "Valid guesses are <red green blue yellow black white>\n>"
      game_turn
    end
  end

  def game_turn
    guess = @code_breaker.guess(input)
    @code_master.validate_guess(guess)
    @game_board.new_guess(@turn, guess)
    @game_board.new_hint(@turn, @code_master.key_hints)
    check_for_win(@code_master.key_hints)
  end

  def check_for_win(hints)
    if hints == CORRECT_GUESS
      puts 'You win!'
      exit!
    elsif @turn == 11
      puts 'You lose! the Secret code was ' \
           "#{@game_board.display_pegs(@code_master.secret_code)}"
      exit!
    else
      @turn += 1
    end
  end
end
