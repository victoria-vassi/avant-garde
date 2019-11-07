class AddPriceToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_monetize :campaigns, :price, currency: { present: false }
  end
end
