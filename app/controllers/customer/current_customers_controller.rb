class Customer::CurrentCustomersController < ApplicationController
    before_action :authenticate_customer!
  def show
    @customer = current_customer
  end
  
  
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "更新しました"
      redirect_to customer_current_customer_mypage_path
    else
      render :edit
    end
  end
    
    def unsubscribe
    end
    
  def withdrawal
  @customer =current_customer
  @customer.update(is_deleted: true)
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :firt_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
  end
    
end
