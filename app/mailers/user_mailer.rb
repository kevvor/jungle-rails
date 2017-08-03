class UserMailer < ApplicationMailer

  def order_confirmation_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your order has been processed :)')
  end
end
