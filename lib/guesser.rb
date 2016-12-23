Dir['./lib/*'].each { |file_name| require file_name }
# The Code Guesser Class
class Guesser < Player
  include Helper
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
      choice_array.map { |choice| CODE_PEGS[choice] }
    end
  end
end
