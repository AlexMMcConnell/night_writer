class Reader
  attr_reader :text_file,
              :translate_file

  def initialize(files)
    @text_file = files[0]
    @translate_file = files[1]
  end

  def split_braille
    split_braille = File.readlines(text_file, chomp: true).flat_map do |line|
      line.scan(/../)
    end
    braille_organizer(split_braille)
  end

  def braille_organizer(array)
    ordered_braille = Array.new(array.length / 3)
  end
end

require 'pry' ; binding.pry
