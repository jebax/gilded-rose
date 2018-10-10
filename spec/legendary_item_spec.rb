require 'legendary_item'

describe LegendaryItem do
  let(:items) { [LegendaryItem.new("Sulfuras, Hand of Ragnaros", 5, 45),
                 LegendaryItem.new("Yulfuras, Foot of Zeus", 5, 45)] }
  before { items.each(&:update) }

  it 'should not update quality' do
    expect(items.first.quality).to eq 45
  end

  it 'should not update sell_in' do
    expect(items.first.sell_in).to eq 5
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      item = LegendaryItem.new("Sulfuras, Hand of Ragnaros", 5, 55)
      item.update
      expect(item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      item = LegendaryItem.new("Yulfuras, Foot of Zeus", 5, -124)
      item.update
      expect(item.quality).to eq 0
    end
  end
end
