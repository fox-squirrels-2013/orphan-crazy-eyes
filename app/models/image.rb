class Image < ActiveRecord::Base
  attr_accessible :image_url, :instagram_id, :vote_count, :pdf_image_url
  validates :image_url, :instagram_id, :presence => true
  has_many :votes

  def votable?(current_user_id)
    votes.map(&:user_id).include?(current_user_id)
  end

end