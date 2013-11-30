class VotesController <ApplicationController

  def create
    @user = current_user
    p "* " * 55
    p @user
    p params
    debugger
    @image = Image.create :user_id => @user.id, :instagram_id => params["instagram_id"], :image_url => params["image_url"]
    @vote = Vote.create(:user_id => @user.id, :image_id => @image.id)
    redirect_to instagram_path(current_user)
  end

end