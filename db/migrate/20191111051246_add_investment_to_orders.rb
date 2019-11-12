class AddInvestmentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :investment, foreign_key: true
  end
end
