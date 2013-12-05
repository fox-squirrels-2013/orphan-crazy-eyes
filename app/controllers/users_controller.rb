class UsersController <ApplicationController
  before_filter :redirect_to_instagram, :only => [:create]

  def create
    user = User.find_or_create_by_auth auth_hash
    if user.present?
      login user
      redirect_to instagram_path(current_user)
    else
      redirect_to root_path, :error => "we're sorry, try signing in again"
    end
  end
end
