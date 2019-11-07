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

  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    @investment.campaign = @campaign
    @investment.user = current_user
    if (@investment.amount < (@campaign.price * (1 - @campaign.funding_status / 100))) && (@campaign.investments.where(user: current_user).empty?)
      @investment.save!
    respond_to do |format|
        # format.html { redirect_to restaurant_path(@restaurant) }
        format.js
      end
    else
      redirect_to new_investment_campaign_path
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
