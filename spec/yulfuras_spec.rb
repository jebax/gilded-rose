require 'yulfuras'

describe Yulfuras do
  let(:yulfuras) { Yulfuras.new("Yulfuras, Foot of Zeus", 5, 45) }
  before { yulfuras.class_update }

  it 'should not update quality' do
    expect(yulfuras.item.quality).to eq 45
  end

  it 'should not update sell_in' do
    expect(yulfuras.item.sell_in).to eq 5
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      yulfuras = Yulfuras.new("Yulfuras, Foot of Zeus", 5, 55)
      yulfuras.update
      expect(yulfuras.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      yulfuras = Yulfuras.new("Yulfuras, Foot of Zeus", 5, -124)
      yulfuras.update
      expect(yulfuras.item.quality).to eq 0
    end
  end
end
