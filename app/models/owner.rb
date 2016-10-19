class Owner < ActiveRecord::Base
  has_many :resturants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => VALID_EMAIL_REGEX
  def self.authenticate(name="",email="")
    if  VALID_EMAIL_REGEX.match(email)
      owner = Owner.find_by_email(email)
      return owner
    else
      owner = Owner.find_by_name(email)
      return false
    end
  end


end
