require 'extreme'

describe Extreme do
  let(:brie) { double(:aged_brie, name: "Aged Brie", quality: 5, sell_in: 45) }
  let(:subject) { Extreme.new(brie) }

  it 'should have a very EXTREME name' do
    expect(subject.name).to eq "EXTREME Aged Brie"
  end

  it 'should update an item twice' do
    expect(brie).to receive(:update).twice
    subject.update
  end
end
