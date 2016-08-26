class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :home
  # has_many :reviews

  # validates :user, presence: true
  # validates :home, presence: true
  # validates :starts_at, presence: true
  # validates :starts_at_time, presence: true
end
