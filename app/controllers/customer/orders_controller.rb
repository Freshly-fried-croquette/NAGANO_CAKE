class Customer::OrdersController < ApplicationController
  
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

end
