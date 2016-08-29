class AddRentPerWeekToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :rent_per_week, :integer
  end
end
