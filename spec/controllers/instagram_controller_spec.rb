require 'spec_helper'

describe InstagramController do
  let(:user) { User.create(uid: 1, access_token: "123", nickname: "miya") }

  describe "instagram show page" do
    context "user logged in" do
      before(:each) do
        stub_current_user user
        stub_client
      end
      it "#index" do
        get :index
        expect(response).to be_redirect
      end

      it "#show" do
        controller.should_receive(:populate_image_db) {}
        get :show, :id => user.id
        expect(assigns(:instagram)).to eq controller.client.user_recent_media(user.uid)
        expect(assigns(:all_tagged)).to eq controller.client.tag_recent_media 'printstagram'
      end

    end
    context "user not logged in" do
      it "#index" do
        get :index
        expect(response).to be_ok
      end
      it "#show" do
        get :show, :id => user.id
        expect(response).to be_redirect
      end
    end
  end

end

