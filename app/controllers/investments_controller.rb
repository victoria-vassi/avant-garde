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
    # @investment.campaign = @campaign
    # @investment.user = current_user
    # authorize @campaign
    # authorize @investment
  end

  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    # authorize @campaign
    @investment.campaign = @campaign
    @investment.user = current_user
    if @investment.save
      redirect_to dashboard_path(@user)
    else
      @investments = Investment.where("campaign_id = '#{params[:campaign_id]}'")
      render 'campaigns/show'
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
