class PurchasesController < ApplicationController
  require "payjp" 
  before_action :cache_card, only: [:index, :buy]
  before_action :set_items,only:[:index]
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

  def done
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @product.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    redirect_to root_path #完了画面に移動
  end


private

  def cache_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @product = Product.find(params[:product_id])
  end

