module AuthHelper
  def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  def stub_user user
    ApplicationController.any_instance.stub(:user) { user }
  end

  def auth_hash
    credentials = double(:credentials, token: "123")
    info =  double(:info, nickname: "miya")
    double(uid: 1, credentials: credentials, info: info)
  end

end


# #<OmniAuth::AuthHash
#   credentials=#<OmniAuth::AuthHash
#     expires=false
#     token="273616543.42e865a.a548ab315dff48ec857a06f7492d3cbe">

#   extra=#<OmniAuth::AuthHash>

#   info=#<OmniAuth::AuthHash::InfoHash
#     bio=""
#     image="http://images.ak.instagram.com/profiles/profile_273616543_75sq_1356382409.jpg"
#     name="Brantley Beaird"
#     nickname="bbeaird84"
#     website="">

#   provider="instagram"
#   uid="273616543"
# >