class HomeReviewsController < ApplicationController
  # before_action :set_booking


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
