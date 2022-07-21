class Master::HomesController < ApplicationController
  def top
    @prodcts = Product.all
  end
end
