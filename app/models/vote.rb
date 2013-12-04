class Vote < ActiveRecord::Base
  attr_accessible :image_id, :user_id

  belongs_to :image
  belongs_to :user

  validates :image_id, :user_id, :presence => true
  validates_uniqueness_of :user_id, :scope => :image_id

end