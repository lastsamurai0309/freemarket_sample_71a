class PurchaseController < ApplicationController
  def index
  end

  def done
    @product_purchase = Product.find(params[:id])
    @product_purchase.update(purchase_histories_id: current_user.id)
  end
end
