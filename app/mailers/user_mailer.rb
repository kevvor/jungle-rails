class UserMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    @email = @order.email
    @total = Money.new(@order.total_cents, "USD")


    mail(to: @email, subject: "order number #{@order.id} :)")
  end
end
