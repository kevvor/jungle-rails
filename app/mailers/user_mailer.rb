class UserMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    @email = @order.email
    @total = @order.total_cents
    mail(to: @email, subject: "order number #{@order.id} :)")
  end
end
