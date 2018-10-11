require_relative 'item'
require_relative 'item_checks'

class AgedCheddar
  include ItemChecks

  def initialize(name, sell_in, quality)
    @item = Item.new(name, sell_in, quality)
    quality_bounds_check
    @update_behaviour
  end

  def item
    @item.dup
  end

  def update
    check_update_behaviour
    @update_behaviour
  end

  def class_update
    update_sell_in
    update_quality
    quality_bounds_check
  end

  private

  def update_sell_in
    @item.sell_in -= 1
  end

  def update_quality
    @item.quality += 1
    @item.quality += 2 if @item.sell_in <= 0
  end
end
