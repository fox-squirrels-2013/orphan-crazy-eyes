module Authentication
  def login user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def redirect_to_instagram
    redirect_to instagram_path(current_user) if current_user.present?
  end

  def authenticate_user
    redirect_to root_path unless current_user
  end
end
