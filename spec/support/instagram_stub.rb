module InstagramStub
  def stub_client
    ApplicationController.any_instance.stub(:client) {
      double(:client, :user_recent_media => [], :tag_recent_media => [])
    }
  end
end