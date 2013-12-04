class Print < ActiveRecord::Base
  attr_accessible :p_user_id, :p_image_urls
  serialize :p_image_urls

  validates :p_user_id, :p_image_urls, presence: :true

end
