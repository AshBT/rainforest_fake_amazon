class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation # NOT :password_digest

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_secure_password


end
