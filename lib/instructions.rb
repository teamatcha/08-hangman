module Instructions
  def display_game_initial
    puts "Welcome to the Hangman Game."
    puts "Some remarks before we begin:"
    puts "If you load a new game, you will have 8 tries to guess the secret word."
    puts "Your number of tries will only be substracted if a new letter is used and wrong."
    puts "You will have access to all the letters (right and wrong) you will have used during the game.\n\n"
    puts "You will be asked if you want to save your game at every turn !"

    puts "Let's begin !"

    puts "Do you want to :"
    puts "[1]. Load New Game"
    puts "[2]. Continue Saved Game"
  end

  def display_save_game
    puts "Do you want to save your game [Y/N]?"
  end

  def display_saved_variables
    puts "Word to guess = #{@guess_word}"
    puts "List of used letters = #{@used_letters}"
    puts "Attempts left = #{@attempts_left}"
  end

  def display_guess_word
    puts "Word = #{@guess_word}"
  end
end
