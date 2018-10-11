require 'gilded_rose'

describe GildedRose do
  let(:brie) { double(:brie, name: "Aged Brie", sell_in: 5, quality: 45) }
  let(:normal) { double(:normal, name: "Vest", sell_in: 5, quality: 45) }
  let(:sulfuras) { double(:sulfuras, name: "Sulfuras", sell_in: 5, quality: 45)}
  let(:items) { [brie, normal, sulfuras] }
  let(:rose) { GildedRose.new(items) }

  it 'should be able to store a list of items' do
    expect(rose.items).to eq items
  end

  it 'should update each item when it updates stock' do
    expect(brie).to receive(:update)
    expect(normal).to receive(:update)
    expect(sulfuras).to receive(:update)
    rose.update_stock
  end
end
