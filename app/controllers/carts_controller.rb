class CartsController < ApplicationController
  before_filter :lookup_cart_from_session

  def show  
  end

  # There is a bug here around adding multiple products.
  # Implement the pending request spec to reveal it.
  def update
    @cart = Cart.create
    @cart.add_product_by_id(params[:product_id])
    session[:cart_id] = @cart.id
    redirect_to cart_path
  end

  private

  # Refactor this to `find_or_create_cart_from_session`
  # as part of the process of fixing the bug.
  def lookup_cart_from_session
    if session[:cart_id]
      @cart = Cart.find_by_id(session[:cart_id])
    end
    @cart ||= Cart.new
  end
end
