require 'backstage_pass'

describe BackstagePass do
  let(:items) { [BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 20, 45),
                 BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 10, 45),
                 BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 5, 45),
                 BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 0, 45)] }
  before { items.each(&:class_update) }

  it 'should increase quality of pass with 20 days before sell_in by 1' do
    expect(items[0].item.quality).to eq 46
  end

   it 'should increase quality of pass with 10 days before sell_in by 2' do
     expect(items[1].item.quality).to eq 47
   end

   it 'should increase quality of pass with 5 days before sell_in by 3' do
     expect(items[2].item.quality).to eq 48
   end

   it 'should set quality of pass to 0 if sell_in date has passed' do
     expect(items[3].item.quality).to eq 0
   end

   describe "#quality_bounds_check" do
     it 'should force an item of quality > 50 to have a quality of 50' do
       pass = BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 5, 55)
       expect(pass.item.quality).to eq 50
     end

     it 'should force an item of quality < 0 to have a quality of 0' do
       pass = BackstagePass.new("Backstage passes to a TAKFAL80ETC concert", 5, -124)
       expect(pass.item.quality).to eq 0
     end
   end
end
