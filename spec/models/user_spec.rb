require 'spec_helper'

describe User do
  it { should validate_presence_of :uid }
  it { should validate_presence_of :access_token }
  it { should validate_presence_of :nickname }

  # it { should have_many :images }
  it { should have_many :votes }
  it { should have_one :subscription}

  describe "#initialize" do
    it "our user model totes exists" do
      User.new.should be_an_instance_of User
    end
  end

end