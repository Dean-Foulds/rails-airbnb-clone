class Home < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :home_reviews
  belongs_to :user
  has_attachments :pictures, maximum: 10
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  STATUS = %w(pending available appointment_made assigned)
  TYPE = %w(room studio flat maisonette bungalow house)
  NUMBER_OF_ROOMS = %w(1 2 3 4)


  validates :address, presence: true
  validates :post_code, presence: true

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end



  # validates :status, inclusion: { in: STATUS }
  # validates :type, inclusion: { in: TYPE }
  # validates :number_of_rooms, inclusion: { in: NUMBER_OF_ROOMS }
  # validates :radius, inclusion: { in: RADIUS }
end
