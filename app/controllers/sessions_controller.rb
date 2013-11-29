class SessionsController <ApplicationController

  def create
    @user = User.find(:uid)
    session[:uid] = @user.uid
  end

  def destroy
    reset_session
  end

end