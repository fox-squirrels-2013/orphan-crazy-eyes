require 'spec_helper'

describe Subscription do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :address_line1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :country }
  it { should validate_presence_of :zip }

  it { should belong_to :user }



  describe "#initialize" do
    it "our subscription model exists" do
      Subscription.new.should be_an_instance_of Subscription
    end
  end

end