require_relative 'player'
# The Code Creator Class
class Master < Player
  attr_reader :key_hints, :secret_code

  def initialize
    @secret_code = generate_code
  end
  
  
end
