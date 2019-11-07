class AddStatusToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :status, :boolean
  end
end
