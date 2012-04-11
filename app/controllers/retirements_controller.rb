class RetirementsController < ApplicationController

  def create
    retirement = Retirement.new(params[:product_id])
    retirement.retire

    redirect_to products_path
  end

end
