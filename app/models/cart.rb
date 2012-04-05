class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products,  :through => :cart_items

  def items
    products
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
