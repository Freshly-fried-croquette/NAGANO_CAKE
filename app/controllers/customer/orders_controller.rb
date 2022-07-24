class Customer::OrdersController < ApplicationController
  
  def confirm
  end
  
  def complete
  end
  
  def index
    @orders = Order.all
  end
    
end
