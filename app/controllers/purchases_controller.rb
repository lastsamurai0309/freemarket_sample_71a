class PurchasesController < ApplicationController
  require "payjp" 
  before_action :set_item,only:[:index]
  before_action :set_card, :set_item
  
  def index
    @product = Product.find(params[:product_id])
    @address = Address.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_customer = customer.cards.retrieve(@card.card_id)

      @card_brand_image = @card_customer.brand
      case @card_brand_image
      when "Visa"
        @card_src = "visa.gif"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "master.gif"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      when "Discover"
        @card_src = "discover.gif"
      end
    
      @card_month = @card_customer.exp_month.to_s
      @card_year = @card_customer.exp_year.to_s.slice(2,3)
      
    else
      redirect_to controller: :cards, action: :new
    end

    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @product.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    Purchase.create(product_id: params[:product_id],user_id: current_user.id)
    @product.update(status: 1)
    flash[:notice] = '購入が完了しました。'
    redirect_to product_path(@product) 
  end

  # def pay 加納の分
  #   # if @product.present?
  #   #   redirect_to product_path(@product.id), alert: "売り切れています。"
  #   # else
  #     # 同時に2人が同時に購入し、二重で購入処理がされることを防ぐための記述方法これらしい（５９行目）
  #     @product.with_lock do
  #     if current_user.card.present?
  #       Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #       Payjp::Charge.create(
  #         :amount => @product.price, #支払金額を引っ張ってくる
  #         :customer => @card.customer_id,  #顧客ID
  #         :currency => 'jpy',              #日本円
  #       )
  #       redirect_to root_path #完了画面に移動
  #       # redirebt_to action: :done
  #     else
  #     # ログインユーザーがクレジットカード登録されていない場合(Checkout機能による処理を行います)
  #     # APIの「Checkout」ライブラリによる決済処理の記述
  #     # ※以下が難しい時は、マイページカード登録画面に飛ぶようにする？（本当ならよくないけど、今回はよしとする。？or登録してくださいのアラートのみ）
  #     Payjp::Charge.create(
  #     amount: @product.price,
  #     card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
  #     currency: 'jpy'
  #     )
  #   end
  #   #ココにID書き換え処理
  #     # @purchase = Purchase.create(buyer_id: current_user.id, product_id: params[:product_id])
  #     params.require(:product).permit(:name, :content, :category_id, :brand, :condition_id, :fee_id, :area_id, :shippingday_id, :price, photos_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id,status: 2)
  #   end
  #     end
  #   # end
  # end
  
  def done
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  end


private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @product = Product.find(params[:product_id])
  end


