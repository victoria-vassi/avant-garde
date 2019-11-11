class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @campaigns = Campaign.all
  end

  def dashboard
    @investments_user = Investment.where("user_id = ?", current_user.id).order("date DESC")

    @total_amount = calculate_total_amount(@investments_user)

    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC").uniq

    @campaigns_user_closed = @campaigns_user.select do |campaign|
      campaign.funded == true
    end
    @campaigns_user_open = @campaigns_user.select do |campaign|
      campaign.funded == false
    end

    @data_labels = create_data_labels(@investments_user)
  end

  def user_profile
    @user = User.find(params[:id])
  end

  private

  def calculate_total_amount(investments_user)
    total_amount = 0
    investments_user.each do |investment|
      total_amount += investment.amount
    end
    return total_amount
  end

  def create_data_labels(investments_user)
    first_month = investments_user.last.date.month - 2
    last_month = investments_user.first.date.month
    month_names_all = ["Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    data_labels = []
    for i in first_month..last_month do
      data_labels << month_names_all[i]
    end
    return data_labels
  end
end
