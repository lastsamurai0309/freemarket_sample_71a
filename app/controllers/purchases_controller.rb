class PurchasesController < ApplicationController
  before_action :set_items,only:[:index,:pay,:done]
  def index
    @product = Product.find(params[:product_id])
    @address = Address.find_by(user_id: current_user.id)

  end

  def done
    @product = Product.find(1)
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  end

  def set_items
    @product = Product.find(params[:product_id])
  end
end