class OrderMailerPreview < ActionMailer::Preview

def new_order
  order = order.last
    OrderMailer.new_order

  end
end
