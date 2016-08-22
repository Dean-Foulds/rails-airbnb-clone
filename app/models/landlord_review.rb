class LandlordReview < ApplicationRecord
  belongs_to :user
  belongs_to :landlord_id
end
