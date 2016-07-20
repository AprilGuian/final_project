class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :role, :string, :default => 'user'
    add_column :users, :role, :integer
  end
end
