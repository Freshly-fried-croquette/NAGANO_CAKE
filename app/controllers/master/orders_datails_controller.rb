class Master::OrdersDatailsController < ApplicationController
  def update
      @order_detail.update(order_detail_params)
  end


  private
  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end
