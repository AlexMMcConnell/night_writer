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

  describe '#creation_message' do
    it 'sends a message stating creation of file and character count' do
      expect(@writer.creation_message).to include('Created')
    end
  end
end
