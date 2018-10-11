class Extreme
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    2.times { @item.class_update }
  end
end
