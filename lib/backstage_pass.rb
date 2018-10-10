class BackstagePass
  attr_reader :name, :sell_in, :quality

  def initialize(sell_in, quality)
    @name = "Backstage pass to a TAFKAL80ETC concert"
    @sell_in = sell_in
    @quality = quality
    quality_bounds_check
  end

  def update
    update_sell_in
    update_quality
    quality_bounds_check
  end

  private

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality += 1
    @quality += 1 if sell_in <= 10
    @quality += 1 if sell_in <= 5
    @quality = 0 if sell_in <= 0
  end

  def quality_bounds_check
    @quality = 50 if quality > 50
    @quality = 0 if quality < 0
  end
end
