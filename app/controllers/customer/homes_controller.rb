class Customer::HomesController < ApplicationController
    
<<<<<<< Updated upstream
    def top
    end
=======
  def top
    @genres = Genre.all
    @products = Product.first(4)
  end
>>>>>>> Stashed changes
    
end
