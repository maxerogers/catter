class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :followings #this is needed otherwise they won't properly map
  has_many :followers, class_name: 'Following', foreign_key: 'user_id'
  has_many :following, class_name: 'Following', foreign_key: 'follower_id'
end
