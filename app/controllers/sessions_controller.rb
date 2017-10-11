class SessionsController < ApplicationController
  def create
    @user = User.from_oauth(request.env["omniauth.auth"])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
