require 'ultra_conjured'

describe UltraConjured do
  let(:items) { [UltraConjured.new("rabbit foot", 5, 45),
                 UltraConjured.new("magic pot", -2, 45)] }
  before { items.each(&:class_update) }

  it 'should reduce conjured quality by -2 before sell_in date' do
    expect(items.first.item.quality).to eq 42
  end

  it 'should reduce quality by -4 after sell_in date' do
    expect(items.last.item.quality).to eq 39
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      hi = UltraConjured.new("hi", 5, 55)
      expect(hi.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      bye = UltraConjured.new("bye", 5, -124)
      expect(bye.item.quality).to eq 0
    end
  end
end
