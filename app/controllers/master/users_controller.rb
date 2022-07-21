class Master::UsersController < ApplicationController
  def index
    @users = Customer.all
  end

  def show
    @user = Customer.find(params[:id])
  end

  def edit
    @user = Customer.find(params[:id])
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報の編集が完了しました。"
      redirect_to master_user_path(@user)
    else
      flash[:error] = "会員情報の編集に失敗しました。"
      render :edit
    end
  end

  def user_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :deleted_user)
  end
end
