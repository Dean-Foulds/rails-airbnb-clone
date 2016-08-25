class CreateAddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :add_column_to_users do |t|
      t.string :avatar

      t.timestamps
    end
  end
end
