class User < ActiveRecord::Base
  has_secure_password validations: false
  has_many :reviews
  has_many :queue_items, -> { order "position" }
  
  validates :username, :email, :password, presence: true
  validates_uniqueness_of :email
end