class Customer::ProductsController < ApplicationController
<<<<<<< Updated upstream
=======
    
  def index
    @products = Product.all
    @genres = Genre.all
    @products = Product.page(params[:page])
  end
    
>>>>>>> Stashed changes
end
