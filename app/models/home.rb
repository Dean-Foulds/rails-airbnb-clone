class Home < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_attachments :pictures, maximum: 3
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  STATUS = %w(pending available appointment_made assigned)
  TYPE = %w(room studio flat maisonette bungalow house)
  NUMBER_OF_ROOMS = %w(1 2 3 4)


  validates :address, :post_code, presence: true
  # validates :status, inclusion: { in: STATUS }
  # validates :type, inclusion: { in: TYPE }
  # validates :number_of_rooms, inclusion: { in: NUMBER_OF_ROOMS }
  # validates :radius, inclusion: { in: RADIUS }
end
