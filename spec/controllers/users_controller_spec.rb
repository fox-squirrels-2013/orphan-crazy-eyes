require 'spec_helper'


describe UsersController do

  before (:each) do
    controller.stub!(:redirect_to_instagram).and_return(true)
  end

  describe "user creation page" do
    xit "#create" do
      post :create, user:{uid: 1, access_token: "123", nickname: "miya"}
      response.status.should eq 200
    end

    xit "#create" do
      expect {
        post :create, user: { uid: 1, access_token: "123", nickname: "miya"}
      }.to change { User.count }.by(1)
    end

    xit "#create" do
      expect {
        post :create, user: { uid: "a", access_token: 123, nickname: ""}
      }.to_not change { User.count }.by(1)
    end
  end

end

