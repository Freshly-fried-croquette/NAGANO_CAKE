# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
 before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
     customer_products_path
  end
  
  def after_sign_out_path_for(resource)
     root_path
  end

  protected
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
     if @customer.valid_password?(params[:customer][:password]) && (@customer.deleted_user == true)
      flash[:error] = "退会済みです。"
      redirect_to root_path
     else
      flash[:error] = "必須項目を入力してください。"
     end
    end
  end
  

  
  
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
