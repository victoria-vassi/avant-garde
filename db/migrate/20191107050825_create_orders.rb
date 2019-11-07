class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state, default: "Pending"
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true
      t.string :checkout_session_id
      t.monetize :amount

      t.timestamps
    end
  end
end
