class Master::ProductsController < ApplicationController

  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to master_products_path
  end
  
  def index
    @products = Product.all.page(params[:page]).per(10)
  end
  
  def show
    @product = Product.find_by(id: params[:id])
  end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :genres_id, :price, :sale_status)
  end
  
  def set_genres
    @genres = Genre.all
  end
    
end
