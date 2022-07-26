class Master::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  private
   def order_params
     params.require(:order).permit(:quantity, :price)
   end
  
end
