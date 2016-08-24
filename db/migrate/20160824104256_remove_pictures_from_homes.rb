class RemovePicturesFromHomes < ActiveRecord::Migration[5.0]
  def change
    remove_column :homes, :pictures
  end
end
