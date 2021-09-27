require_relative 'writer'

class NightWriter
  def write
    text_file_names = ARGV
    writer = Writer.new(text_file_names)
    writer.creation_message
    writer.write if File.file?(text_file_names[0])
  end
end

NightWriter.write
