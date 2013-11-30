class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  helper_method :current_user
end
