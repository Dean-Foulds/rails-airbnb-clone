class AddCoordinatesToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :latitude, :float
    add_column :homes, :longitude, :float
  end
end
