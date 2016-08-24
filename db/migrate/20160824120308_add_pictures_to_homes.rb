class AddPicturesToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :pictures, :string
  end
end
