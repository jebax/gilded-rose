class GildedRose
  SPECIAL = ["Aged Brie",
             "Sulfuras, Hand of Ragnaros",
             "Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    quality_bounds_check(items)
    @items = items
  end

  def update_stock
    update_sell_in
    update_quality
  end

  private

  def update_sell_in
    @items.each do |item|
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end

  def update_quality()
    @items.each do |item|
      if special_check(item.name)
        special_update(item)
      else
        normal_update(item)
      end
    end
    quality_bounds_check(@items)
  end

  def special_check(name)
    SPECIAL.include?(name) || name.match(/Conjured/)
  end

  def special_update(item)
    brie_update(item) if item.name == "Aged Brie"
    passes_update(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
    conjured_update(item) if item.name.match(/Conjured/)
  end

  def brie_update(item)
    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
  end

  def passes_update(item)
    item.quality += 1
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= 0
  end

  def conjured_update(item)
    item.quality -= 2
    item.quality -= 2 if item.sell_in <= 0
  end

  def normal_update(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
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
