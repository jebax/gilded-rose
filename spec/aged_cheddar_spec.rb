require 'aged_cheddar'

describe AgedCheddar do
  let(:items) { [AgedCheddar.new("Aged Cheddar", 5, 45), AgedCheddar.new("Aged Cheddar", -2, 45)] }
  before { items.each(&:update) }

  it 'should update Cheddar quality by +1 if sell_in has not passed' do
    expect(items.first.item.quality).to eq 46
  end

  it 'should update Cheddar quality by +3 if sell_in has passed' do
    expect(items.last.item.quality).to eq 48
  end

  it 'should update sell_in by -1' do
    expect(items.map { |cheddar| cheddar.item.sell_in }).to eq [4, -3]
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      cheddar = AgedCheddar.new("Aged Cheddar", 5, 55)
      expect(cheddar.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      cheddar = AgedCheddar.new("Aged Cheddar", 5, -124)
      expect(cheddar.item.quality).to eq 0
    end
  end
end
