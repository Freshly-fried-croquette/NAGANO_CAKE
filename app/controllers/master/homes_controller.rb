class Master::HomesController < ApplicationController
  def top
    @orders = Order.all
  end
end
