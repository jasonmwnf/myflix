class ReviewsController < ApplicationController
  before_action :require_user
  
  def create
    @video = Video.find(params[:video_id])
    review = Review.new(review_params)
    @video.reviews << review 
    current_user.reviews << review 
    if review.save 
      redirect_to @video
    else
      @reviews = @video.reviews.reload
      render 'videos/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :video_id, :content, :rating)
    end
end