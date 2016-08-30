class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @homes = Home.all
    @home = Home.find(params[:home_id])
    @bookings = @home.bookings
  end

  def new
    @home = Home.find(params[:home_id])
    @booking = Booking.new
    @booking.home = @home
  end

  def create
    @home = Home.find(params[:home_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.home = @home
    if @booking.save
      redirect_to home_bookings_path(@home)
    else
      render "homes/show"
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to homes_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:starts_at, :starts_at_time, :user_id)
  end
end

# def send_booking_confirmation
  #   BookingMailer.booking_confirmation(self).deliver
  # end

# ////////
  # # after_create :send_booking_confirmation

  # def self.home_booked_by_user(home, user)
  #   Booking.exists?(home_id: home.id, user_id: user.id)
  # end

  # def self.available(booking)
  #   if booking.starts_at
  #     this_home_bookings = Booking.where(home_id: booking.home_id)
  #     this_home_bookings.each do |booking|
  #       # if home.status !== "available"
  #       #   return false
  #       # else
  #       #   booking.date
  #       # end
  #       # booking.save
  #     end
  #   end
  # end

