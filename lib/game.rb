require_relative 'instructions.rb'
require_relative 'event_manager.rb'
require_relative 'hangman.rb'
require 'json'

class Game
  attr_accessor :array_word, :used_letters, :attempts_left, :guess_word

  include Instructions
  include Event_manager
  include Hangman

  def initialize
    @used_letters = []
    @attempts_left = 8
  end

  def game_choice
    puts display_game_initial
    case user_input
    when '1' then new_game
    when '2' then load_saved_game
    else game_choice
    end
  end

  def load_saved_game
    load_file
    display_saved_variables
    player_guess
  end

  def new_game
    @array_word = random_word.split("")
    @guess_word = Array.new(@array_word.length, "_")
    display_guess_word
    player_guess
  end

  def save_game?
    display_save_game
    case user_input
    when 'y'
      save_game
      true
    when 'n'
      false
    else
      puts "Input error. Enter Y or N"
      save_game?
    end
  end

  def check_game
    winning? || gameover?
  end

  def winning?
    if @array_word.eql?(@guess_word)
      puts "#{@guess_word.join("")}"
      puts "Congratulations ! You won !"
      true
    end
  end

  def gameover?
    if attempts_left == 0
      puts "You lost..."
      puts "The word was : #{@array_word.join("")}"
      true
    end
  end
end
