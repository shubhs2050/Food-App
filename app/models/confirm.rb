class Confirm < ActiveRecord::Base

  validates :name,:address,:phone,:email, :presence => true

end
