class Vote < ActiveRecord::Base
  attr_accessible :count, :image_id, :user_id
  belongs_to :image, :user
  before_create :zero_votes
  # validates


  def vote!
    self.update_attributes :count => self.count+1
  end

  private

  def zero_votes
    self.count = 0
  end

end