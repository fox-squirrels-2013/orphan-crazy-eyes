class User < ActiveRecord::Base
  attr_accessible :uid, :access_token, :nickname
  has_many :images
  has_many :votes

  def self.find_or_create_by_auth hash
    user = self.find_or_initialize_by_uid hash.uid
    return user if user.persisted?
    user.access_token = hash.credentials.token
    user.nickname = hash.info.nickname
    user.save
    user
  end
end
