class AddStartsTimeAtToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :starts_at_time, :time
  end
end
