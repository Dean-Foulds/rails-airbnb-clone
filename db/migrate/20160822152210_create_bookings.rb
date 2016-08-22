class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.string :date
      t.string :time
      t.text :comments

      t.timestamps
    end
  end
end
