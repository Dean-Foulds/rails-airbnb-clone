class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index# GET /index
    @homes = Home.all
  end

  def show # GET /homes/by ID
    @home = Home.find(params[:id])
    @booking = Booking.new
    # @hash = [ { lat: 54.6568, lng: -3.358805 } ]
    @hash = [ { lat: @home.latitude, lng: @home.longitude } ]
  end

  def new  # GET /homes/new
    @home = Home.new
  end


  def create # POST /homes
    @home = current_user.homes.build(home_params)

    if @home.save
      UserMailer.creation_confirmation(@home).deliver_now
      redirect_to home_path(@home)
    else
      render :new
    end
end

  def edit
  end

  def update
    @home.update(home_params)
    if current_user
      @home.save
      redirect_to home_path(@home)
    end
  end

  def destroy
    @home.destroy
    redirect_to homes_path
end

  private

  # Never trust parameters from the scary
  # internet, only allow the white list.

  def set_home
    @home = Home.find(params[:id])
  end

  def home_params
    params.require(:home).permit(:address, :email, :password, :pictures => [])
  end
end
