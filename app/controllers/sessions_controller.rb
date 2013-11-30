class SessionsController <ApplicationController

  # not being used right now
  def create
    @user = User.find(:uid)
    session[:uid] = @user.uid
  end

  def destroy
    reset_session
  end

end