class VotesController <ApplicationController

  def create
    @user = current_user
    p "* " * 55
    p @user
    p params
    # @image ||= Image.create(instagram_id: )
    @vote = Vote.create(:user_id => @user.id, :image_id => :instagram_id)
    redirect_to instagram_path(current_user)
  end

end