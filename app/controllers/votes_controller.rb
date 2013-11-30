class VotesController <ApplicationController

  def create
    @user = User.find(:id)
    @image = Image.find(:id)
    @vote = Vote.create(user_id: @user.id, image_id: @image.id)
  end

end