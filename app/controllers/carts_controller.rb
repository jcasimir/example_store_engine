class CartsController < ApplicationController

  def show
    respond_to do |format|
      format.html
    end
  end

  def destroy
    cart.destroy
    session[:cart_id] = nil
    redirect_to cart_path
  end

end
