class Customer::OrdersController < ApplicationController

  def confirm
  end

  def complete
  end

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.shopping_carts.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    #初期値＝送料＋合計金額）
    @order.amount_billed = cart_items.inject(@order.postage) { |sum, item| sum + item.sum_of_price }
    if @order.save
      cart_items.each do |cart|
        order_item = OrderDetail.new
        order_item.product_id = cart.item_id
        order_item.order_id = @order.id
        order_item.order_quantity = cart.quantity
        order_item.order_price = cart.product.price
        order_item.save
      end
      redirect_to confirm_customer_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end
  private
  def order_params
    params.require(:order).permit(:name, :address, :amount_billed, :payment_method, :postal_code)
  end
end
