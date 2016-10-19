class ApplicationController < ActionController::Base
#  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
include SessionsHelper

 helper_method :current_order

 def current_order
   if !session[:order_id].nil?
     Order.find(session[:order_id])
   else
     Order.new
   end
 end
end

private

def authenticate_owner
  if session[:owner_id]
    @current_owner = Owner.find session[:owner_id]
    return true
  else
    redirect_to(:controller => 'osessions', :action => 'login')
    return false
  end
end
def save_login_state
  if session[:owner_id]
    redirect_to(:controller => 'osessions', :action => 'home')
    return false
  else
    return true
  end
end
