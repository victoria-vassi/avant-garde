class AddInvestmentsToCertificates < ActiveRecord::Migration[5.2]
  def change
    add_reference :certificates, :investment, foreign_key: true
  end
end
