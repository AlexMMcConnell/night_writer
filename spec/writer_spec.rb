require 'SimpleCov'
SimpleCov.start

require './lib/writer'

describe Writer do
  before(:each) do
    @text_files = ['message1.txt', 'translate1.txt']
    @writer = Writer.new(@text_files)
  end

  it 'is an instance of Writer' do
    expect(@writer).to be_a(Writer)
  end

  it 'has readable attributes' do
    expect(@writer.text_file).to eq('message1.txt')
    expect(@writer.translate_file).to eq('translate1.txt')
  end

  describe 'split_text' do
    it 'splits text into an array' do
      allow(@writer).to receive(:text_file).and_return('message1.txt')
      
      expect(@writer.split_text.length).to eq(76)
      expect(@writer.split_text).to be_a(Array)
    end
  end

  describe 'creation_message' do
    it 'sends a message confirming creation of the new file' do
      allow(@writer).to receive(:translate_file).and_return('translate1.txt')
      allow(@writer).to receive(:split_text).and_return([1, 2, 3, 4])

      expected = "Created 'translate1.txt' containing 4 characters."
      expect(@writer.creation_message).to eq(expected)
    end
  end

  describe 'translator' do
    it 'translates from english to braille' do
      expect(@writer.translator).to be_a(Array)
      expect(@writer.translator[0]).to eq(['0', '.', '0', '0', '.', '.'])
    end
  end

  describe 'write' do
    it 'writes all translated braille into a specified file' do
    end
  end
end
