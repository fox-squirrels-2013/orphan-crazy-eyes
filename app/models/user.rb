class User < ActiveRecord::Base
  attr_accessible :uid, :access_token
  has_many :instagram_pictures
  # validates

end