class CreateHomeReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :home_reviews do |t|
      t.references :user, foreign_key: true
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
