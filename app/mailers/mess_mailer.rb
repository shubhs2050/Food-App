class MessMailer < ApplicationMailer

  def info_owner(owner)
    
  @owner = owner

       mail to: owner.email, subject: "Congrats you have been added to Food App"
  end
end
