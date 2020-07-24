class UsersController < ApplicationController

  def index
  end

  def products
    @products = current_user.products
  end

  def card
  end
  
  def logout
  end

end
