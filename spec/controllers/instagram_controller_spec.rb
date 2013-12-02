require 'spec_helper'


describe InstagramController do

  let!(:user) { User.create(uid: 1, access_token: "123", nickname: "miya") }

  describe "instagram show page" do
    xit "#show" do
      get :show, :id => user.id
      response.status.should eq 200
    end

    it "#index" do
      get :index
      response.status.should eq 200
    end

  end

end

