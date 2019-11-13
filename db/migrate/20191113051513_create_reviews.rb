class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :username
      t.string :image_url
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
