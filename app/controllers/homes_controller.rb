class HomesController < ApplicationController
  def top
    @products = Product.first(4)
  end
end
