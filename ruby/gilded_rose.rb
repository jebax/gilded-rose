class GildedRose
  SPECIAL = ["Aged Brie",
             "Sulfuras, Hand of Ragnaros",
             "Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    quality_bounds_check(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
      special_update(item) if SPECIAL.include? item.name
      normal_update(item) unless SPECIAL.include? item.name
    end
    quality_bounds_check(@items)
  end

  private

  def normal_update(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  end

  def special_update(item)
    brie_update(item) if item.name == SPECIAL.first
    passes_update(item) if item.name == SPECIAL.last
  end

  def brie_update(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
  end

  def passes_update(item)
    item.quality += 1 if item.sell_in > 10
    item.quality += 2 if item.sell_in <= 10
    item.quality += 1 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= 0
  end

  def quality_bounds_check(items)
    items.each do |item|
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
    end
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
