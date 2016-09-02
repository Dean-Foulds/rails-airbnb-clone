class AddContentToHomeReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :home_reviews, :content, :text
  end
end
