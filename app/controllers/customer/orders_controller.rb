class Customer::OrdersController < ApplicationController

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
  
  def complete
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_number] == "1"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:registered])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.address_name = @address.address_name
      @order.payment_method = params[:order][:payment_method]
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
      @cart_items = current_customer.cart_items.all
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }

  end
    private
  def order_params
    params.require(:order).permit(:name, :address, :amount_billed, :payment_method, :postal_code)
  end
end
