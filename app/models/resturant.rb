class Resturant < ActiveRecord::Base

 has_attached_file :image, :styles => {
  :tiny => "25x25#",
  :thumbnail => "100x100#",
  :small  => "150x150>",
  :medium => "300x300>" }
 validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]},size: { in: 0..600.kilobytes }
   default_scope -> { order(created_at: :desc) }
 belongs_to :user
 belongs_to :owner
   has_many :products, :dependent => :destroy
  has_many :categories
validates :name, :owner_name, :presence => true
validates :name, :uniqueness => true
   validates_attachment :image, :presence => true
   
   def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end

end
