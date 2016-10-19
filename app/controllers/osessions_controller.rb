class OsessionsController < ApplicationController
  before_filter :authenticate_owner, :only => [:home, :profile, :setting]
before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    
  end

  def login_attempt
  authorized_owner = Owner.authenticate(params[:name], params[:email])
  if authorized_owner
    session[:owner_id] = authorized_owner.id
    flash[:notice] = "Wow Welcome again, you logged in as #{authorized_owner.name}"
    redirect_back_or authorized_owner
  else
    flash[:notice] = "Invalid ownername or Password"
    flash[:color]= "invalid"
    render "login"
  end
end

def logout
  session[:owner_id] = nil
  redirect_to :action => 'login'
end

  def home
  end


  def profile
  end

  def setting
  end

end
