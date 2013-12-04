require 'spec_helper'

describe VotesController do

  describe "vote stuff" do
    xit "#create" do
      post :create, user:{uid: 1, access_token: "123", nickname: "miya"},
                    image:{image_url: 'www', instagram_id: "123", vote_count: 3},
                    vote:{user_id: 1, image_id: 123}
      response.status.should eq 200
    end

  end

end

