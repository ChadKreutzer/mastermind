require 'minitest/autorun'
require_relative '../lib/master'
require_relative '../lib/guesser'

class MastermindTest < Minitest::Test
  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

  def test_secret_code_is_array_with_length_of_4
    expected = 4
    assert_equal expected, ::Master.new.secret_code.length
  end

  def test_secret_code_is_made_of_symbols
    expected = true
    assert_equal expected, ::Master.new.secret_code.all? do |peg|
      peg.is_a?(Symbol)
    end
  end

  def test_guess_is_array_with_length_of_4
    with_stdin do |user|
      user.puts 'red green black yellow'
      expected = 4
      assert_equal expected, ::Guesser.new.guess.length
    end
  end
end
