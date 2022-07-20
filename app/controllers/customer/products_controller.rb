class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
    @products = Product.page(params[:page])
  end
    
end
