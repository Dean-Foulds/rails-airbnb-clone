class Home < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :home_reviews, dependent: :destroy
  belongs_to :user
  has_attachments :pictures, maximum: 5
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  STATUS = %w(Pending Available Appointment Assigned)
  TYPE = %w(Room Studio Flat Maisonette Bungalow House)

  NUMBER_OF_ROOMS = %w(1 2 3 4)


  validates :address, presence: true
  validates :post_code, presence: true

  # scope :status, -> (status) { where status: status }
  # scope :location, -> (location_id) { where location_id: location_id }
  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}


  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   end



  # validates :status, inclusion: { in: STATUS }
  # validates :type, inclusion: { in: TYPE }
  # validates :number_of_rooms, inclusion: { in: NUMBER_OF_ROOMS }
  # validates :radius, inclusion: { in: RADIUS }
end
