class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title

  def decimal_price
    BigDecimal.new(price, 2)
  end
end
