class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]
  before_action :set_params, only: :create
  before_action :set_categories, only: [:edit, :update]

  def index
    @products = Product.all.where(status: 0).recent(3)
   
    # レディース、メンズ、キッズを表示させたい
    # @ladies = Product.category(1..199).recent
    # @mens = Product.category(200..345).includes(:photos).where(status: 0).recent(1)
    # @kids = Product.category(346..480).includes(:photos).where(status: 0).recent(1)
    # @brandProducts = Product.includes(:photos).where(status: 0).order("id DESC")
    # @parent = Category.where(ancestry: nil)
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
    @product = Product.find(params[:id])
  end

  def destroy

  end

  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = Category.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_params
    params.require(:product).permit(:name, :content, :category_id, :brand, :condition_id, :fee_id, :area_id, :shippingday_id, :price, photos_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id,status: 0)
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end

end
