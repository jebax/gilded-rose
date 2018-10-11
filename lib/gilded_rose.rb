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
