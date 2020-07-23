class PurchaseController < ApplicationController

  require "payjp" 
  

  def index
  end

  def card
    # カード反映〜購入のステータス等ここに記載する。

  end

  def done
    @product_purchase = Product.find(params[:id])
    @product_purchase.update(purchase_histories_id: current_user.id)
  end
end
