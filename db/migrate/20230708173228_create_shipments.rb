class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :source
      t.string :target
      t.string :item
      t.string :status
      t.references :customer, null: false, foreign_key: true
      t.references :delivery_partner, foreign_key: true

      t.timestamps
    end
  end
end
