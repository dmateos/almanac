class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = "Could not create user" unless @user.save
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :position, :phone, :mobile)
  end
end
