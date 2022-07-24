class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_product =ShoppingCart.new
    @genres = Genre.all
  end

  def product_params
    params.require(:products).permit(:genre_id, :name, :introduction, :image, :price)
  end
end
