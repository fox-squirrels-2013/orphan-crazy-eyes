require 'spec_helper'

describe Vote do
  it { should validate_presence_of :image_id }
  it { should validate_presence_of :user_id }

  it { should belong_to :image }
  it { should belong_to :user }

  describe "#initialize" do
    it "our vote model totes exists" do
      Vote.new.should be_an_instance_of Vote
    end
  end

end