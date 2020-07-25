class PurchasesController < ApplicationController
  require_relative './../commonclass/payjp.rb'
  before_action :set_items,only:[:index]
  def index
    @product = Product.find(params[:product_id])
    @address = Address.find_by(user_id: current_user.id)
  end

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


  private

  def set_items
    @product = Product.find(params[:product_id])
  end
end