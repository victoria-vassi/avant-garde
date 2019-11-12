class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :full_name
      t.string :status
      t.string :investor_address
      t.string :investment_amount
      t.string :campaign_name
      t.string :campaign_image
      t.string :campaign_title

      t.timestamps
    end
  end
end
