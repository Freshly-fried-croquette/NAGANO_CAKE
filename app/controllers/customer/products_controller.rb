class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params:id)
    @cart_item =CartItem.new
    @genres = Genre.all
  end
end
