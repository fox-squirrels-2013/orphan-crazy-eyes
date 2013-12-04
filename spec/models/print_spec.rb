require 'spec_helper'

describe Print do
  it { should validate_presence_of :p_user_id }
  it { should validate_presence_of :p_image_urls }

  describe "#initialize" do
    it "our print model exists" do
      Print.new.should be_an_instance_of Print
    end
  end

end