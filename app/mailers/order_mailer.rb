class OrderMailer < ApplicationMailer


  def new_order(confirm)
    @confirm = confirm
    mail to: confirm.email, subject: "New order for #{@order_items}"
  end
end
