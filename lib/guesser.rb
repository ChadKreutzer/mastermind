require_relative 'player'
# The Code Guesser Class
class Guesser < Player
  attr_writer :secret_code
  attr_reader :guess
  
  def guess(player_choice)
    @guess = make_guess(player_choice)
  end
    
  private

  def make_guess(player_choice)
    choice_array = player_choice.downcase.split
    if not_valid_choice?(choice_array)
      print "Your guess contains invalid choice(s), try again\n>"
      make_guess(input)
    elsif not_valid_length?(choice_array)
      print "Wrong number of pegs, try again\n>"
      make_guess(input)
    else
      choice_array.map(&:to_sym)
    end
  end
end
