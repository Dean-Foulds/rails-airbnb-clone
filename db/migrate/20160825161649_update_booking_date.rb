class UpdateBookingDate < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :date
    remove_column :bookings, :time
    add_column :bookings, :starts_at, :date
  end
end
