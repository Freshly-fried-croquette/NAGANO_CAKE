class Master::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(parms[:id])
    @orders = @customer.orders
  end
  private
   def order_params
     params.require(:order).permit(:quantity, :price)
   end
end
