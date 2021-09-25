require 'SimpleCov'
SimpleCov.start

require './lib/reader'

describe Reader do
  before(:each) do
    @text_files = ['translated1.txt', 'translated2.txt']
    @reader = Reader.new(@text_files)
  end

  it 'is an instance of Reader' do
    expect(@reader).to be_a(Reader)
  end

  it 'has readable attributes' do
    expect(@reader.text_file).to eq('translated1.txt')
    expect(@reader.translate_file).to eq('translatd2.txt')
  end

  describe 'split_text' do
    it 'splits text into an array' do
      allow(@reader).to receive(:text_file).and_return('translated1.txt')

      expect(@reader.split_text.length).to eq(46)
      expect(@reader.split_text).to be_a(Array)
    end
  end

  describe 'creation_message' do
    it 'sends a message confirming creation of the new file' do
      allow(@reader).to receive(:translate_file).and_return('translated2.txt')
      allow(@reader).to receive(:split_text).and_return([1, 2, 3, 4])

      expected = "Created 'translate1.txt' containing 4 characters."
      expect(@reader.creation_message).to eq(expected)
    end
  end

  describe 'translator' do
    it 'translates from braille to english' do
      expect(@reader.translator).to be_a(Array)
      expect(@reader.translator[0]).to eq(['h'])
    end
  end
end
