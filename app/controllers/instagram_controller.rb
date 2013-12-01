class InstagramController <ApplicationController
  before_filter :authenticate_user, :only => [:show]
  before_filter :redirect_to_instagram, :only => [:index]

  def index
    # this can be your landing page
  end

  def show
    populate_image_db
    @instagram = client.user_recent_media(current_user.uid)
    @all_tagged = client.tag_recent_media 'collect_a_matron'

    vote!
  end

end
