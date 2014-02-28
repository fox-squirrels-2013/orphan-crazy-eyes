module InstagramOauth
  def auth_hash
    request.env["omniauth.auth"]
  end

  def client
    @client ||= Instagram.client(:access_token => current_user.access_token)
  end
end
