class Customer::CurrentCustomersController < ApplicationController
    before_action :authenticate_customer!
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "更新しました"
      redirect_to customer_path
    else
      render :edit
    end
  end
    
    def unsubscribe
     @customer = Customer.find(params[:id])
    end
    
    def withdrawal
    　@customer = Customer.find(params[:id])
    　@customer.update(is_deleted: true)
    　reset_session
    　flash[:notice] = "退会処理を実行いたしました"
    　redirect_to root_path
    end
    
end
