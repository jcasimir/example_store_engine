class CartItemsController < ApplicationController
  def create
    @cart.add_product_by_id(params[:product_id])
    redirect_to cart_path
  end
end
