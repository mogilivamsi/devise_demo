class UserMailer < ApplicationMailer

  default from: 'sirishagodina9@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def send_otp_mail
    @user = params[:user]
    @otp = @user.current_otp
    mail(to: @user.email, subject: 'Login OTP')
  end

end
