module Hangman
  def user_input
    user = gets.chomp.downcase
  end

  def update_used_letters(letter)
    used_letters << letter
    puts "Used letters : #{used_letters.sort}"
  end

  def index_character(letter)
    @array_word.each_index.select { |index| @array_word[index] == letter }
  end

  def update_guess_word(letter)
    update_used_letters(letter)
    if @array_word.include?(letter)
      array = index_character(letter)
      array.each { |index| @guess_word[index] = letter }
    else
      @attempts_left -= 1
      puts "left attempts : #{@attempts_left}"
    end
  end

  def available_letter?(letter)
    @used_letters.include?(letter) ? (puts "This letter has already been used") : update_guess_word(letter)
  end

  def player_guess
    loop do
      print "Choose a letter: "
      input = user_input
      available_letter?(input)
      display_guess_word
      break if check_game 

      save_game?
    end
  end
end
