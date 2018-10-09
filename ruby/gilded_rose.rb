class GildedRose

  def initialize(items)
    quality_bounds_check(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      passes_update(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.name != "Sulfuras, Hand of Ragnaros"
          item.quality = item.quality - 1 # normal items get -1 quality
        end
      else
        item.quality = item.quality + 1 # special items get +1 by default
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1 # every item except Sulfuras gets -1 sell_in
      end
      if item.sell_in < 0 # starting block for items passed sell_in date
        if item.name != "Aged Brie"
          if item.quality > 0
            if item.name != "Sulfuras, Hand of Ragnaros"
              item.quality = item.quality - 1 # normal items decrease by -2 total if passed sell_in date
            end
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1 # aged brie gets + 2 quality when past sell_in date
          end
        end
      end
    end
    quality_bounds_check(@items)
  end

  private

  def passes_update(item)
    item.quality += 1 if item.sell_in < 11 # +1 runs again for < 11 sell_in, so +2 total
    item.quality += 1 if item.sell_in < 6 # +1 runs twice for < 6 sell_in, so +3 total
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
