class Master::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

 def update
      @order = Order.find(params[:id])
      @order.update(order_params)
 end

  private
   def order_params
     params.require(:order).permit(:quantity, :price ,:order_status)
   end
end
