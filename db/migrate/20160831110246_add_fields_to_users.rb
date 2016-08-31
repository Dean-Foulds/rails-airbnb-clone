class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    drop_table :add_column_to_users
  end
end
