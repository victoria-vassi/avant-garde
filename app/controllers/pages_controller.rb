class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @campaigns = Campaign.all
  end

  def dashboard
    @investments_user = Investment.where("user_id = ?", current_user.id).order("date DESC")

    @total_amount = 0
    @investments_user.each do |investment|
      @total_amount += investment.amount
    end

    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC").uniq

    @campaigns_user_closed = @campaigns_user.select do |campaign|
      campaign.funded == true
    end
    @campaigns_user_open = @campaigns_user.select do |campaign|
      campaign.funded == false
    end
  end

  def user_profile
    @user = User.find(params[:id])
  end

  def contact
  end
end
