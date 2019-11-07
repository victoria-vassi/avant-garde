class ChangePayoutRateToBeFloatInCampaigns < ActiveRecord::Migration[5.2]
  def change
  	change_column :campaigns, :payout_rate, :float
  end
end
