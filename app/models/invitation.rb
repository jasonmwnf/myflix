class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User", foreign_key: 'inviter_id'

  validates :recipient_name, :recipient_email, :message, presence: true

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end