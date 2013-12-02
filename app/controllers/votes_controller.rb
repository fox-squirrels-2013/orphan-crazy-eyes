class VotesController <ApplicationController

  def create
    vote!
    redirect_to instagram_path(current_user)
  end



end