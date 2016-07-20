class EditFieldsToUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :birthdate
  	add_column :users, :birthday, :date
  end
end
