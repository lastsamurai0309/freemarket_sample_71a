class ProductsController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def edit
    
  end

  def update

  end

  def show 
    @item = Item.find(params[:id])
  end

  def destroy

  end
end
