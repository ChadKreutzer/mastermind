Dir['./lib/*'].each { |file_name| require file_name }

puts "Welcome to Mastermind! The goal of the game is to guess the secret\n" \
     'code in 12 or less tries. The code will be four colors long and ' \
     "made up\nof the colors:\n\n * red\n * green\n * yellow\n * blue\n * " \
     "black\n * white\n\nThe computer will give you a black peg for each " \
     "correct color in the right\nplace and a white peg for each correct " \
     "color in the wrong place.\n\nGood Luck!\n"

Game.new.play
