class Extreme
  attr_reader :name, :quality, :sell_in

  def initialize(item)
    @item = item
    @name = "EXTREME #{item.name}"
    @quality = item.quality
    @sell_in = item.sell_in
  end

  def update
    2.times { @item.update }
  end
end
