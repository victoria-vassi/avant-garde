class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def new
    @investment = Investment.new
    @campaign = Campaign.find(params[:campaign_id])
    @investments_user = Investment.where("user_id = ?", current_user.id).order("date DESC")
    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC")
  end



  # update campaign.funding_status
  # a=  sum all investments whose campaign_id = @campaign.id
  # b= @campaign.price
  # a/b*100

  # A user can't invest twice in the same campaign



  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    # authorize @campaign
    @investment.campaign = @campaign
    @investment.user = current_user
    if @investment.amount < (@campaign.price * (1 - @campaign.funding_status / 100))
      @investment.save!
    end
    #   redirect_to dashboard_path(@user)
    # else
    #   # @investments = Investment.where("campaign_id = '#{params[:campaign_id]}'")
    #   render 'campaigns/show'
    # end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
