class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @campaigns = Campaign.all
  end

  def dashboard
    @investments_user = Investment.where("user_id = ?", current_user.id)
    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC")
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
