class Invitation < ActiveRecord::Base
  include Tokenable
  
  belongs_to :inviter, class_name: "User", foreign_key: 'inviter_id'

  validates :recipient_name, :recipient_email, :message, presence: true

  
end