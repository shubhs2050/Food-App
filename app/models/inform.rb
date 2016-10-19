class Inform < ActiveRecord::Base
  validates :name,:email,:resturant_name,:place,:mobile, :presence => true

end
