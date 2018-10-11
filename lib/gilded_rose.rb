class GildedRose
  def initialize(items)
    @items = items
  end

  def items
    @items.dup
  end

  def update_stock
    @items.each(&:update)
  end
end

# class Item
#   attr_accessor :name, :sell_in, :quality
#
#   def initialize(name, sell_in, quality)
#     @name = name
#     @sell_in = sell_in
#     @quality = quality
#   end
#
#   def to_s()
#     "#{@name}, #{@sell_in}, #{@quality}"
#   end
# end
