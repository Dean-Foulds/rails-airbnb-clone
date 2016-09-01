class AddRatingToHomeReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :home_reviews, :rating, :integer
  end
end
