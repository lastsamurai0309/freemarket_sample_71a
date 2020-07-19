class CardsController < ApplicationController
  require "payjp" 

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

      else
        redirect_to action: "new"
        # flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def show
    # @default_card_informateion = {number: "4242424242424242", cvc: "123", exp_month: "01", exp_year: "23"}
  end

  def destroy
  end

  # private
  # def set_card
  #   @card = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
  # end
end
