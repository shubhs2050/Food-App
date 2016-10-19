class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|
      t.string :name
      t.string :resturant_name
      t.string :place
      t.string :mobile

      t.timestamps null: false
    end
  end
end
