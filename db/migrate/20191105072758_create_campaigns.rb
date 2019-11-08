class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :artist
      t.string :title
      t.string :year
      t.date :end_date
      t.integer :minimum_investment
      t.string :category
      t.string :movement
      t.string :technique
      t.string :dimension
      t.string :description_short
      t.string :description_long
      t.integer :value_increase_rate
      t.integer :payout_rate
      t.integer :funding_status
      t.boolean :funded
      t.references :seller, foreign_key: true
      t.references :renter, foreign_key: true

      t.timestamps
    end
  end
end
