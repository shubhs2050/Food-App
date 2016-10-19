class NoticeMailer < ApplicationMailer
  def new_owner(inform)

  @inform = inform

       mail to: "userre30@gmail.com", subject: "New Request for a owner"
  end
end
