class ChangeValueIncreaseRateToBeFloatInCampaigns < ActiveRecord::Migration[5.2]
  def change
  	change_column :campaigns, :value_increase_rate, :float
  end
end
