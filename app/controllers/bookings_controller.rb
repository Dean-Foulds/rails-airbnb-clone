class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @home = Home.find(params[:home_id])
    @bookings = policy_scope(Booking).where(home: @home)
  end

  def new
    @home = Home.find(params[:home_id])
    @booking = Booking.new
    @booking.home = @home
    authorize @booking
  end

  def create
    @home = Home.find(params[:home_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.home = @home
    authorize @booking
    if @booking.save
      redirect_to home_path(params[:home_id])
    else
      render "homes/show"
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to home_path(@booking.home)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def bookings_params
    params.require(:booking).permit(:starts_at, :starts_at_time)
  end
end



#!!!!!!!!!!!!! must implement at some stage!!!!!!!!!!!!!!!!!!!!!!!!!
#
#
#
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

