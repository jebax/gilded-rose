class GildedRose
  SPECIAL = ["Aged Brie",
             "Sulfuras, Hand of Ragnaros",
             "Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    quality_bounds_check(items)
    @items = items
  end

  def update_stock
    @items.each(&:update)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
