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
    { uid: 1, credentials: credentials, info: info }
  end

end