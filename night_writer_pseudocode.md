# How do things happen

## User input and initialization of the translator file

ruby night_writer.rb original_file.txt translated_file.txt

- Take user input for what file you want translated (first argument after loading ruby file) and where you want it saved to (second argument after ruby file).
- Print that the second named file was created and how many characters it contains
- Use ArgV (Argument Vector)
- Figure out how to move text between files and write to files as simply as possible

## Translation

- Hash of letters -> braille counterparts
- Braille written with 0's as bumps and .'s as blanks
- For each individual letter: Pass in letters one at a time, translate, print. Take result array, print it


## Other way around

- Invert the translation from braille to letters
- Same rules otherwise
- For each individual letter: Pass in letters one at a time, translate, print. Take result array, print it


Make sure that things translate cleanly when passed through, even between each other


### Play code for basic workflow (you'll need to make a text file to open)

```ruby

text_file_names =  ARGV

alphabet = File.readlines(text_file_names[0], chomp: true).flat_map do |letter|
  letter.split('')
end

# require 'pry' ; binding.pry

File.open(text_file_names[1], 'w') do |file|
  file.write "#{alphabet[0..4].join}\n"
  file.write alphabet[5..9].join
end

p "Created '#{text_file_names[1]}' containing #{alphabet.length} characters"

```
