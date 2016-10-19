class CreateConfirms < ActiveRecord::Migration
  def change
    create_table :confirms do |t|
      t.string :name
      t.text :address
      t.integer :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
