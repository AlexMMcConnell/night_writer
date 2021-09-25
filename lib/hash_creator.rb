class HashCreator
  def text_to_braille
    split_alphabet = splitter('./lib/alphabet.txt')
    split_braille = splitter('./lib/braille.txt')
    text_to_braille_hash = {}
    split_alphabet.zip(split_braille) do |alpha, braille|
      text_to_braille_hash[alpha] = braille.split('')
    end
    text_to_braille_hash
  end

  def braille_to_text
    split_alphabet = splitter('./lib/alphabet.txt')
    split_braille = splitter('./lib/braille.txt')
    braille_to_text_hash = {}
    split_alphabet.zip(split_braille) do |alpha, braille|
      braille_to_text_hash[braille.split('')] = alpha
    end
    braille_to_text_hash
  end

  def splitter(text_file)
    File.readlines(text_file, chomp: true)
  end
end
