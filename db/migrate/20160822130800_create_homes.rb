class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :type
      t.string :pictures
      t.integer :number_of_rooms
      t.integer :radius
      t.string :status
      t.string :area
      t.string :comments

      t.timestamps
    end
  end
end
