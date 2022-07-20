class Master::UsersController < ApplicationController
  def index
    @users = Customer.all
  end
  
  def show
    @user = Customer.find(params[:id])
end
