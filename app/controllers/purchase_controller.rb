class PurchaseController < ApplicationController

  # require "payjp" 
  # before_action :card, only: [:index, :create, :destroy ]
  

  def index
  end

  # def card
  #   @card = Card.find_by(user_id: current_user.id)
  #   @product = Product.find(params[:id])
  #   # ↑doneの変数と一緒にまとめる？ビフォーとプライベートで。

  #   if @product.buyer.present? 
  #     redirect_back(fallback_location: root_path) 
  #   elsif @card.blank?
  #     # カード情報がなければ、買えないから戻す
  #     redirect_to action: "new"
  #     flash[:alert] = '購入にはクレジットカード登録が必要です'
  #   else
  #     # 購入者もいないし、クレジットカードもあるし、決済処理に移行
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     # 請求を発行
  #     Payjp::Charge.create(
  #     amount: @product.price,
  #     customer: @card.customer_id,
  #     currency: 'jpy',
  #     )
  #     # 売り切れなので、productの情報をアップデートして売り切れにします。
  #     if @product.update(buyer_id: current_user.id)
      
  #       redirect_to root_path, notice: "購入しました。"
  #     else
  #       redirect_to action: 'index'
  #     end
  #   end
  # end

  def done
    @product_purchase = Product.find(params[:id])
    @product_purchase.update(purchase_histories_id: current_user.id)
  end
end
