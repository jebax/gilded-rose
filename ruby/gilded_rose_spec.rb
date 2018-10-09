require File.join(File.dirname(__FILE__), 'gilded_rose')

require 'pry'

describe GildedRose do
  let(:special_items) { [Item.new("Aged Brie", 5, 45),
                         Item.new("Sulfuras, Hand of Ragnaros", 5, 45),
                         Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 45)]
  }

  let(:normal_items) { [Item.new("foo", 10, 10),
                        Item.new("bar", 20, 19)]
  }

  describe "#initialize" do
    it "forces item to start with max quality of 50" do
      items = [Item.new("foo", 0, 51)]
      GildedRose.new(items)
      expect(items.first.quality).to eq 50
    end

    it "forces item to start with min quality of 0" do
      items = [Item.new("foo", 0, -1)]
      GildedRose.new(items)
      expect(items.first.quality).to eq 0
    end
  end

  context "item is special" do
    it 'should have an unchanging list of special items' do
      expect(described_class::SPECIAL).to eq special_items.map(&:name)
    end
  end

  context "item is normal" do
    it 'should reduce quality by 1' do
      GildedRose.new(normal_items).update_quality
      expect(normal_items.map(&:quality)).to eq [9, 18]
    end

    it 'should reduce quality by 2 if sell_in has passed' do
      items = [Item.new("foo", 0, 30)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 28
    end
  end

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items.first.name).to eq "foo"
    end

    it "forces increasing-value item to have max quality of 50 after updating" do
      items = [Item.new("Aged Brie", 0, 51)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 50
    end

    it "forces item to have min quality of 0 after updating" do
      items = [Item.new("foo", 0, -10)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 0
    end
  end

  describe "#passes_update" do
    it 'should increase quality of pass with 20 days before sell_in by 1' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 45)]
      GildedRose.new(items).update_quality
      expect(items.first.quality).to eq 46
    end

     it 'should increase quality of pass with 10 days before sell_in by 2' do
       items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 45)]
       GildedRose.new(items).update_quality
       expect(items.first.quality).to eq 47
     end

     it 'should increase quality of pass with 5 days before sell_in by 3' do
       items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 45)]
       GildedRose.new(items).update_quality
       expect(items.first.quality).to eq 48
     end

     it 'should set quality of pass to 0 if sell_in date has passed' do
       items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 45)]
       GildedRose.new(items).update_quality
       expect(items.first.quality).to eq 0
     end
  end

end
