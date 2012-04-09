class Cart < ActiveRecord::Base
  has_many :items,     :class_name => :CartItem
  has_many :products,  :through    => :items

  def add_or_increment_by_product_id(product_id)
    if product_ids.include?(product_id.to_i)      
      increment_quantity_for(product_id)
    else
      add_product_by_id(product_id)
    end
  end

  def increment_quantity_for(product_id)
    item = items.find_by_product_id(product_id)
    item.quantity += 1
    item.save
    return item.quantity
  end

  def total
    items.sum{|i| i.total }
  end

  def add_product(product)
    products << product
  end

  def add_product_by_id(product_id)
    product = Product.find(product_id)
    add_product(product)
  end
end
