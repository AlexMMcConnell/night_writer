require_relative 'writer'

text_file_names = ARGV

writer = Writer.new(text_file_names)
writer.creation_message
writer.write if File.file?(text_file_names[0])
