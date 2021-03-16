require 'json'
t = Time.now.strftime('%Y%m%d_%H%M')

# p t
fo = []
Dir.glob('**/*.json').each do |f|
  puts File.basename(f)
end

=begin

  def random_word
    file = File.open('test.txt')
    file_lines = file.readlines()
    file_lines.collect(&:strip).select { |word| word.length.between?(5, 12) }.sample.downcase
  end

  array_word = random_word.split("")
  p array_word

  guess_word = Array.new(array_word.length, "_")
  p guess_word

  used_letters = []
  attempts = 8

  puts "Choose "
  puts "1. Load New Game"
  puts "2. Continue Saved Game"
  choice = gets.chomp

  ## PLAY GAME
  # OPTION AT EVERY TURN : SAVE THE GAME
  loop do
    user = gets.chomp.downcase

    if used_letters.include?(user)
      puts "Already used ! Choose another one"
    else
      used_letters << user
      if array_word.include?(user)
        indexes = array_word.each_index.select { |index| array_word[index] == user }
        indexes.each { |index| guess_word[index] = user }
        p guess_word

      else
        attempts -= 1
        puts "attemps left #{attempts}"
      end
      p used_letters
    end

    break if attempts == 0 || array_word.eql?(guess_word)
  end
=end
