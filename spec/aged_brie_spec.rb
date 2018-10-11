require 'aged_brie'
require 'pry'

describe AgedBrie do
  let(:items) { [AgedBrie.new("Aged Brie", 5, 45), AgedBrie.new("Aged Brie", -2, 45)] }
  before { items.each(&:update) }

  it 'should update brie quality by +1 if sell_in has not passed' do
    expect(items.first.item.quality).to eq 46
  end

  it 'should update brie quality by +2 if sell_in has passed' do
    expect(items.last.item.quality).to eq 47
  end

  it 'should update sell_in by -1' do
    expect(items.map { |brie| brie.item.sell_in }).to eq [4, -3]
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      brie = AgedBrie.new("Aged Brie", 5, 55)
      expect(brie.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      brie = AgedBrie.new("Aged Brie", 5, -124)
      expect(brie.item.quality).to eq 0
    end
  end
end
