class UltraConjured
  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = "Ultra-Conjured #{name}"
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
    @quality -= 3
    @quality -= 3 if sell_in <= 0
  end

  def quality_bounds_check
    @quality = 50 if quality > 50
    @quality = 0 if quality < 0
  end
end
