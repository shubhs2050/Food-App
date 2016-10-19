class AddPaperclipToResturant < ActiveRecord::Migration
  def change
    add_attachment :resturants, :image

  end
end
