class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => REDIRECT)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to :controller => 'feed', :action => 'index'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
