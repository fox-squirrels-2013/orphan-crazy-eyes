require 'spec_helper'


describe SessionsController do

  let!(:user) { User.create(uid: 1, access_token: "123", nickname: "miya") }

  describe "session end page" do
    xit "#destroy" do
      expect {
        delete :destroy, id: user.id
      }.to change{ User.count }.by(-1)
    end

  end

end

