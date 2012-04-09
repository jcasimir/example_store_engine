class ApplicationController < ActionController::Base
  before_filter :find_or_create_cart_from_session

  protect_from_forgery

  private

  def find_or_create_cart_from_session
    if session[:cart_id]
      @cart = Cart.find_by_id(session[:cart_id])
    end
    @cart ||= Cart.create
    session[:cart_id] = @cart.id
  end
end
