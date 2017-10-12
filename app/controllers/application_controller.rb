class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #<---gives access to your views

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
