require 'normal_item'

describe NormalItem do
  let(:items) { [NormalItem.new("foo", 5, 45), NormalItem.new("bar", -2, 45)]}
  before { items.each(&:update) }

  it 'should reduce quality by 1' do
    expect(items.first.quality).to eq 44
  end

  it 'should reduce quality by 2 if sell_in has passed' do
    expect(items.last.quality).to eq 43
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      item = NormalItem.new("foo", 5, 55)
      expect(item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      item = NormalItem.new("bar", 5, -124)
      expect(item.quality).to eq 0
    end
  end
end
