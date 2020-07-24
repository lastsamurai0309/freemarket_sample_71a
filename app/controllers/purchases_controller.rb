class PurchasesController < ApplicationController
  def index
    @product = Product.find(1)
    @address = Address.find_by(user_id: current_user.id)

  end

  def done
    @product = Product.find(1)
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  end
end
