class InstagramController <ApplicationController
  before_filter :authenticate_user, :only => [:show]
  before_filter :redirect_to_instagram, :only => [:index]

  def index
    # this can be your landing page
  end

  def show
    @instagram = client.user_recent_media(current_user.uid)
    @tag = client.tag_recent_media 'collect_a_matron'
  end

end
