class UsersController <ApplicationController
  before_filter :redirect_to_instagram, :only => [:create]
# order: index show new create edit update destroy

  def new

  end

  def create
    user = User.new :uid => auth_hash.uid, :access_token => auth_hash.credentials.token, :nickname => auth_hash.info.nickname
    if user.save
      session[:user_id] = user.id
      session[:access_token] = auth_hash.credentials.token
      redirect_to instagram_path(current_user)
    else
      redirect_to root_path
      # handle errors
    end
  end

  private

  def redirect_to_instagram
    redirect_to instagram_path(current_user) if current_user
  end

end