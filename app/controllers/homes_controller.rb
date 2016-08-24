class HomesController < ApplicationController
  before_action :set_home, only: [:show]

  def index# GET /index
    @homes = Home.all
  end

  def show # GET /homes/by ID
    @home = Home.find(params[:id])
    @alert_message = "You are viewing #{@home.address}"
    @home_coordinates = { lat: @home.latitude, lng: @home.longitude }
  end

  def new  # GET /homes/new
    @home = Home.new
  end


  def create # POST /homes
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      redirect_to home_path(@home)
    else
      render :new
    end
  end

  private

  # Never trust parameters from the scary
  # internet, only allow the white list.

  def set_home
    @home = Home.find(params[:id])
  end

  def home_params
    params.require(:home).permit(:address, :pictures)
  end
end
