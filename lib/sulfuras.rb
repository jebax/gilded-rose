class Sulfuras
  attr_reader :name, :sell_in, :quality

  def initialize(sell_in, quality)
    @name = "Sulfuras, Hand of Ragnaros"
    @sell_in = sell_in
    @quality = quality
    quality_bounds_check
  end

  def update
    update_sell_in
    update_quality
  end

  private

  def update_sell_in
  end

  def update_quality
  end

  def quality_bounds_check
    @quality = 50 if @quality > 50
    @quality = 0 if @quality < 0
  end
end
