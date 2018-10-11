require 'conjured'

describe Conjured do
  let(:items) { [Conjured.new("rabbit foot", 5, 45),
                 Conjured.new("magic pot", -2, 45)] }
  before { items.each(&:class_update) }

  it 'should reduce conjured quality by -2 before sell_in date' do
    expect(items.first.item.quality).to eq 43
  end

  it 'should reduce quality by -4 after sell_in date' do
    expect(items.last.item.quality).to eq 41
  end

  describe "#quality_bounds_check" do
    it 'should force an item of quality > 50 to have a quality of 50' do
      hi = Conjured.new("hi", 5, 55)
      expect(hi.item.quality).to eq 50
    end

    it 'should force an item of quality < 0 to have a quality of 0' do
      hi = Conjured.new("bye", 5, -124)
      expect(hi.item.quality).to eq 0
    end
  end
end
