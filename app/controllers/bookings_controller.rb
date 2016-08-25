class BookingsController < ApplicationController
  # before_filter :authenticate_user!

  def new
    @booking = Booking.new(bookings_params)
  end

  def create
    @home = Home.find(params[:home_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user

    if Booking.available(@booking)
      @booking.save
      redirect_to homes_path, notice: "Viewing booked! An email confirmation has been sent to you and the landlord."
    else
      redirect_to :back, notice: "This booking is not avaiable! Try another home"
    end
  end

private

  def bookings_params
    params.require(:booking).permit(:date, :home_id, :user_id)
  end
end
