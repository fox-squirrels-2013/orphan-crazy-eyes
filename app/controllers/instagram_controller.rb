class InstagramController <ApplicationController
  before_filter :authenticate_user, :only => [:show]
  before_filter :redirect_to_instagram, :only => [:index]

  def index
  end

  def show
    populate_image_db
    @instagram = client.user_recent_media(current_user.uid, {max_id: @next} )
    @all_tagged = client.tag_recent_media 'printstacard'
  end

end
