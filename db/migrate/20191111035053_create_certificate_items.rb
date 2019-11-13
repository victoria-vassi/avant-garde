class CreateCertificateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :certificate_items do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.references :certificate, foreign_key: true

      t.timestamps
    end
  end
end
