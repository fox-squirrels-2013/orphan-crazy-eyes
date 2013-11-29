class OauthController < ApplicationController
  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => ENV['CALLBACK_URL'])
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['CALLBACK_URL'])
    session[:access_token] = response.access_token
    p "session[:access_token] = #{session[:access_token]} !!!!!!!!!!!!!!!!"
    redirect_to "http://localhost:3000/oauth/feed"
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    user = client.user
    p "client = #{client}"
    p "user = #{user}"
    media_feed = Instagram.user_media_feed
    # Instagram.user_recent_media(777)
  end

end
