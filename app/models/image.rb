class Image < ActiveRecord::Base
  attr_accessible :image_url, :instagram_id, :user_id
  belongs_to :user
  # validates

end