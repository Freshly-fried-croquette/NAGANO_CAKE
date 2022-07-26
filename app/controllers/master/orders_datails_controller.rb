class Master::OrdersDatailsController < ApplicationController
  def update
    
      @order_details = OrderDetail.find(params[:id])
      @order = @order_details.order
      @order_details.update(order_detail_params)
      redirect_to master_order_path(@order.id)
  end


  private
  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end
