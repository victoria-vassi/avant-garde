class ReviewsController < ApplicationController
 def create
    @campaign = Campaign.find(params[:campaign_id])
    @review = Review.new(review_params)
    @review.campaign = @campaign

    if @review.save
      redirect_to campaign_path(@campaign)
    else
      redirect_to campaign_path(@campaign)
    end
end

  private

  def review_params
    params.require(:review).permit(:content, :image_url, :username)
  end

end
