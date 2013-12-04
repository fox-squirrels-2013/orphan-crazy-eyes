require 'spec_helper'

describe Image do
  it { should validate_presence_of :image_url }
  it { should validate_presence_of :instagram_id }
  it { should validate_presence_of :vote_count }

  it { should have_many :votes }

  describe "#initialize" do
    it "our image model totes exists" do
      Image.new.should be_an_instance_of Image
    end
  end

end