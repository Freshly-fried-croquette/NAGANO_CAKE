class Master::ProductsController < ApplicationController

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to master_product_path(@product)
    else
      redirect_to request.referer
    end
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :sale_status)
  end

  def set_genres
    @genres = Genre.all
  end

end
