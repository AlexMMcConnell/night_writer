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

      expect(@writer.split_text.length).to eq(46)
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

    it 'sends Invalid text file name if invalid text file' do
      allow(@writer).to receive(:text_file).and_return('nananahahaha')

      expected = "Invalid text file name."
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
      expect(@writer.write).to eq([])
    end
  end

  # I don't know how to test the following three methods any more precisely than I have here
  describe 'first_two_dots' do
    it 'writes the first two dots for each braille letter' do
      elements = [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]]
      expect(@writer.first_two_dots(elements)).to eq(1)
    end
  end

  describe 'middle_two_dots' do
    it 'writes the middle two dots for each braille letter' do
      elements = [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]]
      expect(@writer.middle_two_dots(elements)).to eq(1)
    end
  end

  describe 'last_two_dots' do
    it 'writes the last two dots for each braille letter' do
      elements = [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]]
      expect(@writer.last_two_dots(elements)).to eq(1)
    end
  end
end
