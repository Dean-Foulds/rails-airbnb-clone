class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :user_id, foreign_key: true
      t.string :address
      t.string :type
      t.url :pictures
      t.integer :number_of_rooms
      t.integer :radius
      t.string :status
      t.string :area
      t.text :comments

      t.timestamps
    end
  end
end
