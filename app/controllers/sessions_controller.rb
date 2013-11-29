class SessionsController <ApplicationController

  def create
    session[:uid] = User.find_by(:uid)
  end

  def destroy
    reset_session
  end

end