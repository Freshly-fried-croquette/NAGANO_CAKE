class Customer::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    @products = Product.all.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item =CartItem.new
    @genres = Genre.all
  end
  
  private
 def product_params
  params.require(:products).permit(:genre_id, :name, :description, :image, :price)
 end
end
