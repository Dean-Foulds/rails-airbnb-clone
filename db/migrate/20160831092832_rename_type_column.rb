class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :homes, :type, :room_type
  end
end
