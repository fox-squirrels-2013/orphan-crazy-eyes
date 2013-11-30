class ApplicationController < ActionController::Base
  protect_from_forgery
  include InstagramOauth
  include Authentication

  helper_method :current_user
end
