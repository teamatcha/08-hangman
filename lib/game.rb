require_relative 'instructions.rb'
require_relative 'event_manager.rb'

require 'json'

class Game
  attr_accessor :array_word, :used_letters, :attempts_left, :guess_word

  include Instructions
  include Event_manager

  def initialize
    @used_letters = []
    @attempts_left = 8
  end

  def game_choice
    puts display_game_initial
    choice = gets.chomp
    case choice
    when '1' then new_game
    when '2' then load__saved_game
    end
  end

  def load__saved_game
    load_file
    p @guess_word
    p @used_letters
    puts "attepts left #{@attempts_left}"
    player_guess
  end

  def random_word
    file = File.open('test.txt')
    file_lines = file.readlines()
    file_lines.collect(&:strip).select { |word| word.length.between?(5, 12) }.sample.downcase
  end

  def new_game
    @array_word = random_word.split("")
    @guess_word = Array.new(@array_word.length, "_")
    puts "guess = #{@guess_word}"
    player_guess
  end

  def save_game?
    puts display_save_game
    user = gets.chomp
    if user == 'Y'
      save_game
      true
    elsif user == 'N'
      false
    else
      puts "Input error."
      save_game?
    end
  end

  def player_guess
    loop do
      puts "Choose a letter:"
      input = gets.chomp.downcase
      available_letter?(input)
      puts "guess = #{@guess_word}"
      break if check_game

      save_game?
    end
  end

  def check_game
    winning? || gameover?
  end

  def winning?
    if @array_word.join("").eql?(@guess_word.join(""))
      puts "#{@guess_word.join("")}"
      puts "You win !"
      true
    end
  end

  def gameover?
    if @attempts_left == 0
      puts "You lost"
      puts "The word was : #{@array_word.join("")}"
      true
    end
  end

  def update_used_letters(user)
    @used_letters << user
    puts "Used letters : #{@used_letters.sort}"
  end

  def check_word(user)
    update_used_letters(user)
    if @array_word.include?(user)
      array = check_letter(user)
      array.each { |index| @guess_word[index] = user }
    else
      @attempts_left -= 1
      puts "left attemps : #{@attempts_left}"
    end
  end

  def check_letter(user)
    @array_word.each_index.select { |index| @array_word[index] == user }
  end

  def available_letter?(user)
    used_letters.include?(user) ? (puts "Already used") : check_word(user)
  end
end
