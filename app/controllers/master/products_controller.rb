class Master::ProductsController < ApplicationController
<<<<<<< Updated upstream
=======
    
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    product = Product.new(product_params)
    product.save
    redirect_to customer_products_path
  end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :genres_id, :price, :sale_status)
  end
    
>>>>>>> Stashed changes
end
