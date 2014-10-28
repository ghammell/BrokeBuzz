class Item < ActiveRecord::Base
  before_save :convert_abv
  before_save :calc_price_per_oz


  def convert_abv
    self.abv = abv / 100
  end

  def calc_price_per_oz
    ml_per_oz = 29.5735

    if volume_type == 'ml'
      volume_in_oz = volume / ml_per_oz
    else
      volume_in_oz = volume
    end

    self.oz_of_alc = self.abv * volume_in_oz * quantity
    self.price_per_oz = price / self.oz_of_alc
  end
end