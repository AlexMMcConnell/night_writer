require 'SimpleCov'
SimpleCov.start

require './night_writer'

describe NightWriter do
  before(:each) do
    @writer = NightWriter.new
  end

  it 'is an instance of NightWriter' do
    expect(@writer).to be_a(NightWriter)
  end
end
