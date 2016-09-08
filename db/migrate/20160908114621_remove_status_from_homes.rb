class RemoveStatusFromHomes < ActiveRecord::Migration[5.0]
  def change
    remove_column :homes, :status, :string
  end
end
