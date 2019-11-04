class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :name
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
