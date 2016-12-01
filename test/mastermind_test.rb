require 'minitest/autorun'
Dir['../lib/**.*'].each { |file| require_relative file }

class MastermindTest < Minitest::Test
  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end
  
end