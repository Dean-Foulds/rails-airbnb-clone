class AddRepairReportToHomeReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :home_reviews, :repair_report, :text
  end
end
