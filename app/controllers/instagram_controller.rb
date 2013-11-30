class InstagramController <ApplicationController
  before_filter :authenticate_user
  def show
    client = Instagram.client(:access_token => session[:access_token])
    @instagram = client.user_recent_media(current_user.uid)
    p @instagram[0]
    @dinodraw = client.tag_recent_media('dinodraw')
    # @instadino = @instagram.tag_recent_media('dinodraw')
  end

  private
  def authenticate_user
    redirect_to new_user_path unless current_user
  end

end