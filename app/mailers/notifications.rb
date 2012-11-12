class Notifications < ActionMailer::Base
  default from: "cchike@herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_order.subject
  #
  def new_order(order)
    @greeting = "Hi Chris"
    @order = order

    mail to: order.user.email
  end
end
