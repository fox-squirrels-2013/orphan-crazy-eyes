class UsersController <ApplicationController
# order: index show new create edit update destroy

  def index

  end

  def create
    p "* " * 50
    @cred = auth_hash.credentials.token
    @instagram = Instagram.user_recent_media("16676245")
    # debugger
    # render :create
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end