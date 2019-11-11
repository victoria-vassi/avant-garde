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
    @data_series = create_data_series(@investments_user)
  end

  def user_profile
    @user = User.find(params[:id])
  end

  def contact
  end

  def help
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
    data_labels = []
    first_month = investments_user.last.date.month - 2
    last_month = investments_user.first.date.month
    month_names_all = ["Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    for i in first_month..last_month do
      data_labels << month_names_all[i]
    end
    return data_labels
  end

  def create_data_series(investments_user)
    data_series = []
    first_month = investments_user.last.date.month - 1
    last_month = investments_user.first.date.month + 1
    monthly_investments = []
    for i in first_month..last_month do
      sum = 0
      investments_user_month = investments_user.select do |investment|
        investment.date.month == i
      end
      investments_user_month.each do |investment|
        sum += investment.amount
      end
      monthly_investments << sum
    end
    monthly_investments.each_with_index do |monthly_sum, index|
      sum = 0
      for i in 0..index do
        sum += monthly_investments[i]
      end
      data_series << sum
    end
    return data_series
  end
end
