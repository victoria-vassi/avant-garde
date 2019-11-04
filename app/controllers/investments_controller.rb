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
    authorize @campaign
    authorize @investment
  end

  def create
    @investment = Investment.new
    @campaign = Campaign.find(params[:campaign_id])
    @user = current_user
    authorize @campaign
    @investment.campaign = @campaign
    @investment.user = @user
    if @investment.save
      redirect_to dashboard_path(@user)
    else
      @investments = Investment.where("campaign_id = '#{params[:campaign_id]}'")
      render 'campaigns/show'
    end
  end
end
