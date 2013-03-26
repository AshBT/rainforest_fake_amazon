class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation # NOT :password_digest

  validates_presence_of :password, :on => :create
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_many :reviews
  
end
