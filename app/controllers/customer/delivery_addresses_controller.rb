class Customer::DeliveryAddressesController < ApplicationController
  before_action :authenticate_customer!
 

  def index
    @addresses = current_customer.delivery_addresses.all
    @address = DeliveryAddress.new
  end

  def create
    @address = DeliveryAddress.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to customer_delivery_addresses_path
    else
      @addresses = current_customer.delivery_addresses
      render :index
    end
  end

  def update
    @address = DeliveryAddress.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "更新しました"
      redirect_to customer_delivery_addresses_path
    else
      render :edit
    end
  end

  def edit
    @address = DeliveryAddress.find(params[:id])
  end

  def destroy
    @address = DeliveryAddress.find(params[:id])
    @address.destroy
    redirect_to customer_delivery_addresses_path
  end

  private

  def address_params
    params.require(:delivery_address).permit(:customer_id, :name, :address, :postal_code)
  end
end