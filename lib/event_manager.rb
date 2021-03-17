require 'json'

module Event_manager
  def list_json_files_saved
    Dir.glob('**/*.json').map do |f|
      File.basename(f)
    end
  end

  def load_file
    p list_file = list_json_files_saved.sort
    puts "Choose the file to load among the list from 1 to #{list_file.size}"
    index = gets.chomp
    file_to_load = list_file[index.to_i - 1]

    file = JSON.parse(File.read(file_to_load))
    @array_word = file['initial_word']
    @used_letters = file['used_letter']
    @guess_word = file['guess_word']
    @attempts_left = file['attempts_left']
  end

  def save_game
    Dir.mkdir('output') unless Dir.exists?('output')
    time = Time.now.strftime('%Y%m%d_%H%M')
    filename = "output/save_game_#{time}.json"
    temp_hash = { "initial_word" => @array_word, "used_letter" => @used_letters, "guess_word" => @guess_word,
                  "attempts_left" => @attempts_left }
    File.open(filename, 'w') do |file|
      file.write(temp_hash.to_json)
    end
    puts "Game saved"
  end

  def random_word
    file = File.open('5desk.txt')
    file_lines = file.readlines()
    file_lines.collect(&:strip).select { |word| word.length.between?(5, 12) }.sample.downcase
  end
end
