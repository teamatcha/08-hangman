module Instructions
  def display_game_initial
    puts "Welcome to the Hangman Game."
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
