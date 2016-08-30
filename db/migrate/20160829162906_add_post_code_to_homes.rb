class AddPostCodeToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :post_code, :string
  end
end
