class Home < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 3

  STATUS = %w(pending available appointments assigned)
  TYPE = %w(room studio flat maisonette bunglow house)
  NUMBER_OF_ROOMS = %w(1 2 3 4)
  RADIUS = %w(1_mile 5_miles 10_miles 25_miles)

  validates :name, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :type, inclusion: { in: TYPE }
  validates :number_of_rooms, inclusion: { in: NUMBER_OF_ROOMS }
  validates :radius, inclusion: { in: RADIUS }
end
