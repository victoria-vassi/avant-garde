class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @campaigns_open = Campaign.where("funded = false").order("end_date DESC")
    @campaigns_closed = Campaign.where("funded = true").order("end_date DESC")
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
end
