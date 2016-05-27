class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "User authenticated"
    else
      flash[:alert] = "Invalid username or password"
    end

    redirect_to "/"
  end

  def destroy

  end
end
