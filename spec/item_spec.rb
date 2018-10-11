require 'item'

describe Item do
  let(:item) { double(:normal, name: "Vest", sell_in: 5, quality: 45) }
  let(:subject) { Item.new(item.name, item.sell_in, item.quality) }

  it 'should be able to store an item\'s name' do
    expect(subject.name).to eq "Vest"
  end

  it 'should be able to store an item\'s sell_in' do
    expect(subject.sell_in).to eq 5
  end

  it 'should be able to store an item\'s quality' do
    expect(subject.quality).to eq 45
  end

  it 'should be able to display an item\'s attributes in a string' do
    string = "#{subject.name}, #{subject.sell_in}, #{subject.quality}"
    expect(subject.to_s).to eq string
  end
end
