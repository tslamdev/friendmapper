class User < ActiveRecord::Base
  attr_accessible :email, :facebook_access_token, :facebook_id, :location, :name, :password_digest
end
