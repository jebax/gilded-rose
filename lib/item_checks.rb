require_relative 'extreme'

module ItemChecks
  def quality_bounds_check
    @item.quality = 50 if @item.quality > 50
    @item.quality = 0 if @item.quality < 0
  end

  def check_update_behaviour
    if @item.name.match(/EXTREME/)
      @update_behaviour = Extreme.new(self).update
    else
      @update_behaviour = class_update
    end
  end
end
