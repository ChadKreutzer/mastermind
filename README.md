# Mastermind

## Your Task
Build a Mastermind game from the command line where you have 12 turns to guess
the secret code, starting with you guessing the computer's random code.

1. Think about how you would set this problem up!
2. Build the game assuming the computer randomly selects the secret colors and
   the human player must guess them. Remember that you need to give the proper
   feedback on how good the guess was each turn!
3. Now refactor your code to allow the human player to choose whether she wants
   to be the creator of the secret code or the guesser.
4. Build it out so that the computer will guess if you decide to choose your
   own secret colors. Start by having the computer guess randomly (but keeping
   the ones that match exactly).
5. Next, add a little bit more intelligence to the computer player so that, if
   the computer has guessed the right color but the wrong position, its next
   guess will need to include that color somewhere. Feel free to make the AI
   even smarter.

## The Rules of Mastermind

### The play of the game goes as follows:

1. One player, known as the Codemaker, secretly places the 4 Code Pegs in the 4
   holes, which are then covered by flipping over the plastic shield to conceal
   them from the opponent's sight. The Codemaker can use any combination of the
   6 colors he chooses. He can also use 2 or more Code Pegs of the same color
   if he wishes.
2. The other player, known as the Codebreaker, sits opposite the Codemaker and
   places Code Pegs in the 1st row of the Code Peg holes (closest to him). The
   Codebreaker is attempting to duplicate the exact colors and positions of the
   secret code.
3. The Codemaker responds by placing 0, 1, 2, 3, and 4 Key Pegs in the Key Peg
   holes on the 1st row as follows:
   * A black Key Peg to indicate a Code Peg of the right color and in the
      right position (without indication of which Code Peg it corresponds to).
   * A white Key Peg to indicate a Code Peg of the right color but in the
      wrong position.
   * No Key Peg to indicate a wrong color that does not appear in the secret
      code.

There is nothing about the placement of the Key Pegs to indicate which
particular Code Pegs are meant. It is part of the challenge of the game for the
Codebreaker to figure out which Code Pegs correspond to particular Key Pegs.
The response when 2 pegs of the same color appear in the secret code and/or in
the Codebreaker's row can cause some confusion. The basic principles are that
**one Key Peg corresponds to one Code Peg** and, that **a black Key Peg takes
precedence over a white one**.