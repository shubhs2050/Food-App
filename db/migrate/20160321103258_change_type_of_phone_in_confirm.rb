class ChangeTypeOfPhoneInConfirm < ActiveRecord::Migration
  def change
    change_column :confirms, :phone, :string

  end
end
