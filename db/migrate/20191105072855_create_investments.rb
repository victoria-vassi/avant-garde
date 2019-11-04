class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :amount
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
