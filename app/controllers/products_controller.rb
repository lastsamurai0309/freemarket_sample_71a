class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :set_params, only: :create

  def index

  end

  def new
    @product = Product.new
    @product.photos.new
  end

  def create
    @product = Product.new(set_params)
    if @product.save
      flash[:alert] = '出品が完了しました。'
      redirect_to controller: :products, action: :index, notice: "出品できました。"
    else
      flash[:alert] = '必須事項を入力してください。'
      redirect_to controller: :products, action: :new
    end
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

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_params
    params.require(:product).permit(:name, :content, :category_id, :brand, :condition_id, :fee_id, :area_id, :shippingday_id, :price, photos_attributes: [:name]).merge(user_id: current_user.id,status: 0)
  end
end
