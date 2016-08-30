class AddRentPerMonthToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :rent_per_month, :integer
  end
end
