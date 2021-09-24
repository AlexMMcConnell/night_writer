require 'SimpleCov'
SimpleCov.start

require './lib/writer'

describe Writer do
  before(:each) do
    @text_files = ['./lib/message1.txt', 'translate1.txt']
    @writer = Writer.new(@text_files)
  end

  it 'is an instance of Writer' do
    expect(@writer).to be_a(Writer)
  end

  it 'has readable attributes' do
    expect(@writer.text_file).to eq('./lib/message1.txt')
    expect(@writer.translate_file).to eq('translate1.txt')
  end

  describe 'split_text' do
    it 'splits text into an array' do
      expect(@writer.split_text.length).to eq(11)
      expect(@writer.split_text).to be_a(Array)
    end
  end

  describe 'creation_message' do
    it 'sends a message confirming creation of the new file' do
      expected = "Created 'translate1.txt' containing 11 characters."
      expect(@writer.creation_message).to eq(expected)
    end
  end
end
