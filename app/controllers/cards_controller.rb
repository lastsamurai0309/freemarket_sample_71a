class CardsController < ApplicationController
  require "payjp" 

  def index
    if @card.present?

      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::customer.retrieve(@card.customer_id)
      @card_customer = customer.cares.retrieve(@card.card_id)

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
      @card_year = @card_customer.exp_year.to_s.slice(-2)
      # ★上手く年が取り出せないときは、↑のsliceが原因 slice(2,3)に変更する（と多分上手くいくはず？）
      
    else
      redirect_to action: "new"
    end
  end

  def new
  end
  
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjp_token"].blank?
      # binding.pry
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
        flash[:alert] = 'クレジットカード登録が成功しました'

      else
        redirect_to action: "new"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    if @card.destroy
      # フラッシュメッセージをいれる
    else
      redirect_to card_path(current_user.id), alert: "削除できませんでした。"
    end




  end

  # private
  # def set_card
  #   @card = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
  # end
end
