class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    session[:uid]
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
