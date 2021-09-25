require 'SimpleCov'
SimpleCov.start

require './lib/hash_creator'

describe HashCreator do
  before(:each) do
    @creator = HashCreator.new
  end

  it 'is an instance of a Hash Creator' do
    expect(@creator).to be_a(HashCreator)
  end

  describe 'text_to_braille' do
    it 'returns a hash with letters assigned to braille' do
      expect(@creator.text_to_braille.length).to eq(53)
      expect(@creator.text_to_braille).to be_a(Hash)
    end
  end
  
  describe 'splitter' do
    it 'creates an array out of the given input' do
      expect(@creator.splitter("./lib/braille.txt").length).to eq(53)
      expect(@creator.splitter("./lib/braille.txt")).to be_a(Array)
    end
  end
end
