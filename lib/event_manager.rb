require 'json'

module Event_manager
  def list_json_files_saved
    Dir.glob('**/*.json').each do |f|
      File.basename(f)
    end
  end

  def load_file
    p list_file = list_json_files_saved
    puts "Choose the file to load among the list starting at 1"
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
end
