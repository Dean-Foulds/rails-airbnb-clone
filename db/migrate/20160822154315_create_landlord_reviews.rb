class CreateLandlordReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :landlord_reviews do |t|
      t.references :user, foreign_key: true
      t.references :landord, foreign_key: true

      t.timestamps
    end
  end
end
