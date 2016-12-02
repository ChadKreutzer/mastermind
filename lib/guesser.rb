require_relative 'player'
# The Code Guesser Class
class Guesser < Player
  attr_writer :secret_code
  attr_reader :guess
  
  private
  
  def make_guess
    guess = gets.chomp.to_s.downcase.split
    if guess.length != 4
      make_guess
    elsif !guess.all? { |x| x =~ /(red|blue|yellow|green|white|black)/ }
      make_guess
    else
      guess
    end
  end
    
end
