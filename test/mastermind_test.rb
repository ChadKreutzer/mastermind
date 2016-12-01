require 'minitest/autorun'
Dir['../lib/**.*'].each { |file| require_relative file }

class MastermindTest < Minitest::Test
end