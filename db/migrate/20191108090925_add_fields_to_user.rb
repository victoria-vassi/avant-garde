class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :string
    add_column :users, :languages, :string
    add_column :users, :location, :string
    add_column :users, :user_image, :string
    add_column :users, :phone_number, :string
  end
end
