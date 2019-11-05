class AddPhotoToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :photo, :string
  end
end
