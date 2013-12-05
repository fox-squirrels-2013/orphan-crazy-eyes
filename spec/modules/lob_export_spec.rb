require 'spec_helper'

describe LobExport do

  let!(:user) { User.create(uid: 10, access_token: "123", nickname: "miya") }
  let!(:image) { Image.create(instagram_id: "123", image_url: "http") }
  let!(:subscription) { Subscription.create(user_id: 1, first_name: "miya", last_name: "pyne", address_line1: "810 grand", city: "San Francisco", state: "CA", country: "US", zip: "12345") }
  let!(:vote) { Vote.create(image_id: 1, user_id: 1) }

  # it "creates at least one print job" do
  #   expect {
  #     LobExport.monthly_check
  #     }.to change{ Print.count }.by(1)
  # end
end
