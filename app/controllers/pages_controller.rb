class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @campaigns = Campaign.all
  end

  def dashboard
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
