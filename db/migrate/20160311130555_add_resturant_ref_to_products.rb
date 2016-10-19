class AddResturantRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :resturant, index: true, foreign_key: true

  end
end
