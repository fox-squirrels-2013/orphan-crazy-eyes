class User < ActiveRecord::Base
  attr_accessible :uid, :access_token, :nickname
  has_many :images
  has_many :votes
  # validates

end