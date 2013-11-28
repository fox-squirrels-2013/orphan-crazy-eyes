class UsersController < ApplicationController
  def index
    Instagram.configure do |config|
      config.client_id = "fa61a189ff4c4c86aa7f7297999c765a"
      config.client_secret = "0054e83a656f4235b2b83164d76bc741"
      # config.REDIRECT-URI = "http://localhost:3000/oauth/callback"
      # ENV['CALLBACK_URL'] = "http://localhost:3000/oauth/callback"
    end

  end

end
