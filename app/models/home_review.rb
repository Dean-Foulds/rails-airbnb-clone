class HomeReview < ApplicationRecord
  belongs_to :user
  belongs_to :home

  validates :content, presence: true
  validates :content, length: { minimum: 1}
  validates :rating, presence: true
  validates :rating, inclusion: {in: (1..5).to_a}
  validates :home, presence: true
  # validates :user, presence: true
end
