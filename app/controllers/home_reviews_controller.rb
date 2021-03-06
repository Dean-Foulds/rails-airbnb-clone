class HomeReviewsController < ApplicationController

  # skip_before_action :authenticate_user!
  before_action :set_home
  # before_action :set_user

  def create
    @home_review = HomeReview.new(home_review_params)
    authorize @home_review
    @home_review.home = @home
    if @home_review.save
      respond_to do |format|
        format.html { redirect_to home_path(@home) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'homes/show' }
        format.js  # <-- idem
      end
    end
    # if @home_review.save
    #   redirect_to home_path(@home)
    # else
    #   render :new
    # end
  end


  private

  def set_home
    @home = Home.find(params[:home_id])
  end

  def home_review_params
    params.require(:home_review).permit(:content, :repair_report, :rating)
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def home_review_params
  #   params.require(:home).permit(:content, :rating)
  # end



  # def show
  #   @review = Review.find(params[:id])
  # end

  # def new
  #   @review = @booking.reviews.build
  # end

  # def create
  #   @booking.find(params[:id])
  #   @review = Review.new(review_params)
  #     if @review.save
  #       redirect_to booking_path(@booking)
  #     else
  #       render :new
  #     end
  # end

  # private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  # def review_params
  #   params.require(:review).permit(:description, :rating)
  # end

end
