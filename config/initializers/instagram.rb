Instagram.configure do |config|

  config.client_id = ENV['INSTAGRAM_CLIENT_ID']

  config.access_token = "#{@cred}"

end