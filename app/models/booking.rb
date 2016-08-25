class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :home

  # after_create :send_booking_confirmation

  def self.home_booked_by_user(home, user)
    Booking.exists?(home_id: home.id, user_id: user.id)
  end

  def self.available(booking)
    if booking.date
      this_home_bookings = Booking.where(home_id: booking.home_id)
      this_home_bookings.each do |booking|
        # if home.status !== "available"
        #   return false
        # else
        #   booking.date
        # end
        booking.save
      end
    end
  end

  # def send_booking_confirmation
  #   BookingMailer.booking_confirmation(self).deliver
  # end
end
