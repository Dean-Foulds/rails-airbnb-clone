class AddSharedAndHmoStatusToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :rshared_and_hmo_status, :boolean, default: true
  end
end
