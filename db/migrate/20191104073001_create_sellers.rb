class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
