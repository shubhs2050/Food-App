class AddOwnerRefToResturants < ActiveRecord::Migration
  def change
    add_reference :resturants, :owner, index: true, foreign_key: true

  end
end
