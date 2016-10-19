class Add < ActiveRecord::Migration
  def change
    add_column :informs, :email, :string
  end
end
