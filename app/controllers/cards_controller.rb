class CardsController < ApplicationController
  require "payjp" 

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      render "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        # metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, payjp_id: customer.id)
      if @card.save
      else
        redirect_to action: "create"
      end
    end
  end

  private
  def set_card
    @card = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
  end
end
