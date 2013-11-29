class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @user ||= User.find(:uid)
    session[:uid] = @user.uid
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
