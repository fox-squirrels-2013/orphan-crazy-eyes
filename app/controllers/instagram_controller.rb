class InstagramController <ApplicationController
  before_filter :authenticate_user
  def show
    @user = current_user
    client = Instagram.client(:access_token => session[:access_token])
    @instagram = client.user_recent_media(current_user.uid)
    @tag = client.tag_recent_media 'collect_a_matron'
    # debugger
    # @image = Image.create :user_id => @user.id
    # trying to figure out how to count votes...
    # if @image_id
    #   @count = Vote.find_by(:image_id => 6).count
    # end
  end

  private
  def authenticate_user
    redirect_to new_user_path unless current_user
  end

end