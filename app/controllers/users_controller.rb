class UsersController <ApplicationController
# order: index show new create edit update destroy

  def index
    # @instagram = Instagram.user_recent_media("user_id_here", {:count => 1})
  end

  def create
    debugger
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end