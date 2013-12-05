require 'spec_helper'

describe UsersController do
  let(:user) { User.create(uid: 1, access_token: "123", nickname: "miya") }

  describe "user creation page" do

    before (:each) do
      # stub_current_user user
      # stub_user user
    end

    it "#create" do
      controller.stub(:auth_hash) { auth_hash }
      post :create
      expect(response).to be_redirect
    end

    it "#create" do
      controller.stub(:auth_hash) { auth_hash }
      expect {
        post :create
      }.to change { User.count }.by(1)
    end

    xit "#create" do
      expect {
        post :create, user: { uid: "a", access_token: 123, nickname: ""}
      }.to_not change { User.count }.by(1)
    end
  end

end
