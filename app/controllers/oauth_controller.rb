class OauthController < ApplicationController
  def connect
    # CALLBACK_URL = "http://localhost:3000/oauth/callback"
    redirect_to Instagram.authorize_url(:redirect_uri => "http://localhost:3000/oauth/callback")
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect "/feed"
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    user = client.user

    html = "<h1>#{user.username}'s recent photos</h1>"
    for media_item in client.user_recent_media
      html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    html
  end

end
