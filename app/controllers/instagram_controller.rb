class InstagramController <ApplicationController

  def show
    @instagram = Instagram.user_recent_media(current_user)
    redirect_to instagram_path(current_user)
  end

end