class UsersController <ApplicationController
# order: index show new create edit update destroy

  def index

  end

  def create
    @access_token = auth_hash.credentials.token
    session[:uid] = auth_hash.uid
    redirect_to instagram_path(current_user)
    p "* " * 55
    p auth_hash
    p "* " * 55
    p params
    p "* " * 55
  end

end