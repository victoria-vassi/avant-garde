class AddStartDateToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :start_date, :date
  end
end
