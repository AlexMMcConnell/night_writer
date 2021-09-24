require_relative 'writer'

text_file_names = ARGV

writer = Writer.new(text_file_names)
writer.creation_message
