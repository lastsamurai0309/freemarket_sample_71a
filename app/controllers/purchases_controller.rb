class PurchasesController < ApplicationController
  require "payjp" 
  before_action :purchas
  # 購入と商品の違い？
  before_action :cache_card, only: [:index, :buy]

  require_relative './../commonclass/payjp.rb'
  before_action :set_items,only:[:index]
  def index
    @product = Product.find(params[:product_id])
    @address = Address.find_by(user_id: current_user.id)
  end

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

    if @product.purchas.present? 
      bindng.pry
      redirect_to action: :index, alert:"この商品は売り切れています"
  
    elsif @card.blank?
      redirect_to controller: :cards, action: :index, alert: "商品を購入するためには、クレジットカード登録が必要です。"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #決まりの記載方法↓
      Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
        if @product.update(buyer_id: current_user.id)
        
          redirect_to root_path, notice: "購入しました。"
        else
          redirect_to action: 'index'
        end
    end
  end

  def done
    # @product = Product.find(1)
    @address = Address.find_by(user_id: current_user.id)
    @product.update(purchase_histories_id: current_user.id)
  def new
    @purchase = Purchase_history.new
  end

  def create
    @purchase = Purchase_history.new(user_id:   current_user.id,
                            product_id:  @product.id
                           )
    if @purchase.save
      Payjp.create_charge_by_token(current_user.card.customer_id,
                                    @product.price)
      @product.update(status: 1)
      redirect_to root_path, notice: "購入が完了しました"
    else
      render :new
    end
  end
end

private

  def purchas
    @product = Product.find(1)
  end

  def cache_card
    @card = Card.find_by(user_id: current_user.id)
  end


  private

  def set_items
    @product = Product.find(params[:product_id])
  end


