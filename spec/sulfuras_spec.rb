require 'sulfuras'

describe Sulfuras do
  let(:sulfuras) { Sulfuras.new("Sulfuras, Hand of Ragnaros", 5, 45) }
  before { sulfuras.class_update }

  it 'should not update quality' do
    expect(sulfuras.item.quality).to eq 45
  end

  it 'should not update sell_in' do
    expect(sulfuras.item.sell_in).to eq 5
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      sulfuras = Sulfuras.new("Sulfuras, Hand of Ragnaros", 5, 55)
      sulfuras.update
      expect(sulfuras.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      sulfuras = Sulfuras.new("Sulfuras, Hand of Ragnaros", 5, -124)
      sulfuras.update
      expect(sulfuras.item.quality).to eq 0
    end
  end
end
