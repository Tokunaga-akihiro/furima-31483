class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string      :postal_code,               null: false, default: ""
      t.integer     :shipping_area_id,          null: false
      t.string      :municipality,              null: false, default: ""
      t.string      :address,                   null: false, default: ""
      t.string      :building_name,             
      t.string      :phone_number,              null: false, default: ""
      t.references  :purchase_record,           foreign_key: true
      t.timestamps
    end
  end
end
