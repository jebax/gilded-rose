require 'yulfuras'

describe Yulfuras do
  let(:item) { Yulfuras.new(5, 45) }
  before { item.update }

  it 'should not update quality' do
    expect(item.quality).to eq 45
  end

  it 'should not update sell_in' do
    expect(item.sell_in).to eq 5
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      item = Yulfuras.new(5, 55)
      item.update
      expect(item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      item = Yulfuras.new(5, -124)
      item.update
      expect(item.quality).to eq 0
    end
  end
end
