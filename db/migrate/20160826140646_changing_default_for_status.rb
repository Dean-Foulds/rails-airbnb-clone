class ChangingDefaultForStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :home_status, :string, :default => "available"
  end
end
