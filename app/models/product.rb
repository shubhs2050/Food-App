class Product < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  belongs_to :resturant
  has_attached_file :image, :styles => {
   :tiny => "25x25#",
   :thumbnail => "100x100#",
   :small  => "150x150>",
   :medium => "300x300>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]},size: { in: 0..600.kilobytes }
    #default_scope -> { order(created_at: :desc) }
    validates :name, :price, :presence => true
    validates :price, :numericality => { :greater_than_or_equal_to => 0 }
    validates :price, :numericality => { :less_than_or_equal_to => 10000 }
   validates :name, :uniqueness => true
  default_scope { where(active: true) }

end
