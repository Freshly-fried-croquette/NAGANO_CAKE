class Master::HomesController < ApplicationController
  def top
    @products = Product.all.page(params[:page]).per(10)
  end
end
