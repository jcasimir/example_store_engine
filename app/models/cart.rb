class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products,  :through => :cart_items

  def add_or_increment_by_product_id(product_id)
    if product_ids.include?(product_id.to_i)      
      increment_quantity_for(product_id)
    else
      add_product_by_id(product_id)
    end
  end

  def increment_quantity_for(product_id)
    cart_item = cart_items.find_by_product_id(product_id)
    cart_item.quantity += 1
    cart_item.save
    return cart_item.quantity
  end

  def items
    products
  end

  def total
    cart_items.sum{|i| i.total }
  end

  # Eventually, we'll want to use CartItems instead of
  # using Products directly, because we will have more
  # functionality to put onto CartItem (such as remembering)
  # the price of a product at the time it was added to the cart).
  #
  # For now, we've may have looked too far ahead,
  # because we do not yet need those features.
  def add_item(product)
    products << product
  end

  def add_product_by_id(product_id)
    product = Product.find(product_id)
    add_item(product)
  end
end
