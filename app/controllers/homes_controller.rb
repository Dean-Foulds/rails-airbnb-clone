class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index# GET /index
    @homes = policy_scope(Home).where(home_status: "available")
    @homes = @homes.near(params[:address], 5) if params[:address].present?
    @homes = @homes.where(room_type: params[:types]) if params[:types].present? && params[:types].any?
    @homes = @homes.where(number_of_rooms: params[:rooms]) if params[:rooms].present?
    @hash = Gmaps4rails.build_markers(@homes) do |home, marker|
      marker.lat home.latitude
      marker.lng home.longitude
    end
  end

  def show # GET /homes/by ID
    @booking = Booking.new
    @home_review = HomeReview.new(home: @home)
    # @hash = [ { lat: 54.6568, lng: -3.358805 } ]
    @hash = [ { lat: @home.latitude, lng: @home.longitude } ]
  end

  def new  # GET /homes/new
    @home = Home.new
    authorize @home
  end

  def create # POST /homes
    @home = current_user.homes.build(home_params)
    authorize @home
    if @home.save
      redirect_to home_path(@home)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @home.destroy
    redirect_to homes_path
  end

  private

  # Never trust parameters from the scary
  # internet, only allow the white list.
  #
   def user_not_authorized
    flash[:alert] = "You are not authorised to complete this action"
    redirect_to(request.referrer || root_path)
  end

  def set_home
    @home = Home.find(params[:id])
    authorize @home
  end

  def home_params
    params.require(:home).permit(:address, :post_code, :room_type, :number_of_rooms, :home_status, :comments, :pictures => [])
  end
end
