class UsersController < ApplicationController
  def index
    # @products = Product.includes(:user).order("created_at DESC")
  end

  def products
    @products = current_user.products
  end

  def card
  end
  
  def logout
  end

end
