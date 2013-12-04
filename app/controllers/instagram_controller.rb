class InstagramController <ApplicationController
  before_filter :authenticate_user, :only => [:show]
  before_filter :redirect_to_instagram, :only => [:index]

  def index
    # this can be your landing page
  end

  def show
    populate_image_db
    vote!
  end

end
