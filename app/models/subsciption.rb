class Subscription < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address_line1,
  :address_line2, :city, :state, :country, :zip
  belongs_to :user

end
