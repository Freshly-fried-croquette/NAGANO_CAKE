class Master::OrdersController < ApplicationController
  def index
  end
  def show
    @customer = customer.find(params[:id])
    @order = order.find(params[:id])
  end
  private
   def order_params
     params.require(:order).permit(:quantity, :price)
   end
   def customer_params
    params.require(:customer).permit(:last_name, :firt_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
   end
end
 