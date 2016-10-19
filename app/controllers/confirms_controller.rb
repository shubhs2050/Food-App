class ConfirmsController < ApplicationController

  def index
  end

def new
  @confirm = Confirm.new()
end

def create
@confirm = Confirm.new(confirm_params)
  if @confirm.save
    OrderMailer.new_order(@confirm).deliver_now
    flash[:success] = "Your order has been placed successfully!"
    redirect_to root_path
  else
    render "new"
  end
end

def show
  @confirms = Confirm.all
  end

private

def confirm_params
    params.require(:confirm).permit(:name, :address, :phone, :email)
  end

end
