require_relative 'reader'

text_file_names = ARGV

reader = Reader.new(text_file_names)
reader.creation_message
reader.read if File.file?(text_file_names[0])
