class AppMailer < ActionMailer::Base
  def send_welcome_email(user)
    @user = user
    mail(to: admin_or_user(@user.email), from: "info@myflix.com", subject: "Welcome to MyFlix!")
  end

  def send_forgot_password(user)
    @user = user
    mail(to: admin_or_user(@user.email), from: "info@myflix.com", subject: "Please reset your password")
  end

  def send_invitation_email(invitation)
    @invitation = invitation
    mail(to: admin_or_user(@invitation.recipient_email), from: "info@myflix.com", subject: "Invitation to join MyFlix")
  end

  private

    def admin_or_user(email)
      if Rails.env.staging?
        'ENV['ADMIN_EMAIL']'
      else
        email
      end
    end
end