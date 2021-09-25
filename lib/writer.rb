require_relative 'hash_creator'

class Writer
  attr_reader :text_file,
              :translate_file,
              :creator

  def initialize(files)
    @text_file = files[0]
    @translate_file = files[1]
    @creator = HashCreator.new
  end

  def split_text
    split_text = File.readlines(text_file, chomp: true).flat_map do |line|
      line.split('')
    end
  end

  def creation_message
    p "Created '#{translate_file}' containing #{split_text.length} characters."
  end

  def translator
    text_to_braille_hash = creator.text_to_braille
    split_text.map do |letter|
      text_to_braille_hash[letter]
    end
  end
end
