Dir['./lib/*'].each { |file_name| require file_name }

Game.new.play
