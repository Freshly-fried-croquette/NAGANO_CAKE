class Master::UsersController < ApplicationController
  def index
    @users = Customer.all
  end
end
