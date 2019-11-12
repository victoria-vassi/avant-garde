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
    # scale_image = @campaign.images.first.photo == "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/Koons1_evduwn.jpg"
    # @img_class = scale_image ? 'scale-image' : nil
  end

  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    @user = current_user
    @investment.campaign = @campaign
    @investment.user = @user
    @investment.date = Date.today
    @investment.save
      if @investment.save!
        current_funding = @campaign.price*@campaign.funding_status/100
        current_funding += @investment.amount
        new_funding_status = (current_funding.to_f/@campaign.price.to_f*100).to_i
        @campaign.funding_status = new_funding_status
        @campaign.save!
        respond_to do |format|
      # format.html { redirect_to dashboard_path(@user) }
        format.js
        end

      else
        respond_to do |format|
        format.html { render 'campaign_path(@campaign)'}
        format.js
      end
    end

  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
