class AddDateToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :date, :date
  end
end
