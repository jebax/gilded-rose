require 'ultra_conjured'
require 'pry'

describe UltraConjured do
  let(:items) { [UltraConjured.new("rabbit foot", 5, 45),
                 UltraConjured.new("magic pot", -2, 45)] }
  before { items.each(&:update) }

  it 'should reduce UltraConjured quality by -3 before sell_in date' do
    expect(items.first.quality).to eq 42
  end

  it 'should reduce quality by -6 after sell_in date' do
    expect(items.last.quality).to eq 39
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      item = UltraConjured.new("hi", 5, 60)
      expect(item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      item = UltraConjured.new("bye", 5, -124)
      expect(item.quality).to eq 0
    end
  end

end
