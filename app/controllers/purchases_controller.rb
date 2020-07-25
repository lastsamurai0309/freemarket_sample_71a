class PurchasesController < ApplicationController
  require "payjp" 
  # before_action :purchas
  # # 購入と商品の違い？
  before_action :cache_card, only: [:index, :buy]

  require_relative './../commonclass/payjp.rb'
  before_action :set_items,only:[:index]
  
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
  end

  def buy
    # 　ここが、売り切れかどうか判断する記述です　ココから
    if @product.purchas.present? 
      bindng.pry
      redirect_to action: :index, alert:"この商品は売り切れています"
    #　ココまで  　以下コメントアウトは削除可能
    else
      #売り切れてないときのコード記述＝大谷さんの内容？
    end
  end 

  def done
    # @product = Product.find(1)
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  end

private

  def cache_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_items
    @product = Product.find(params[:product_id])
  end

