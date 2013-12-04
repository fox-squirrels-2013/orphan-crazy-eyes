class Subscription < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address_line1,
  :address_line2, :city, :state, :country, :zip, :user_id
  belongs_to :user
  validates :first_name, :last_name, :address_line1, :city, :state, :country, :zip, :user_id, :presence => true

  def full_name
    self.first_name + " " + self.last_name
  end

end
