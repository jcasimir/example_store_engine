class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title

  default_scope order(:title)

  def self.active
    where(:retired => false)
  end

  def decimal_price
    BigDecimal.new(price, 2)
  end

  def retire
    self.retired = true
    save
  end
end
