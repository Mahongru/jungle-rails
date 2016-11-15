class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(order)
    @order = order
    @total = order.total_cents / 100
    mail(to: order.email, subject: "Confirmation for Order #{order.id}" )
  end
end
